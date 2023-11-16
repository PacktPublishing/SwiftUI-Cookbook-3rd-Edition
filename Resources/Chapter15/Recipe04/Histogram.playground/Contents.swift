//import SwiftUI
import GameplayKit
import Charts

struct HistogramBin {
    let index: Int
    let range: ChartBinRange<Int>
    let frequency: Int
}

struct Histogram {
    let bins: [HistogramBin]
    private let xMin: Int
    private let xMax: Int
    var xDomain: [Int] { [xMin, xMax] }
    private(set) var maxY: Int
}

extension Histogram {
    static func generate(lowestValue: Int, highestValue: Int, numberOfTimes: Int = 10000, numberOfBins: Int = 25) -> Histogram {
        let randomSource = GKRandomSource()
        let generator = GKGaussianDistribution(randomSource: randomSource, lowestValue: lowestValue, highestValue: highestValue)
        let dataSet: [Int]  = (0..<numberOfTimes).map { _ in generator.nextInt() }
        let minimumStride = (highestValue - lowestValue) / numberOfBins
        let bins = NumberBins(data: dataSet, desiredCount: numberOfBins, minimumStride: minimumStride)
        let thresholds = bins.thresholds
        let groupedData = Dictionary(grouping: dataSet) { bins.index(for: $0) }
        let data: [HistogramBin] = groupedData.map { key, values in
            .init(index: key, range: bins[key], frequency: values.count)
        }
        let padding = (highestValue - lowestValue) / 10
        let maxY = data.reduce(data[0].frequency) { maxFrequency, bin in
            maxFrequency > bin.frequency ? maxFrequency : bin.frequency
        }
        return Histogram(bins: data, xMin: lowestValue - padding, xMax: highestValue + padding, maxY: maxY)
    }
}

func generateHistogram() -> Histogram {
    let numberOfDice = 25
    let lowestValue =  numberOfDice
    let highestValue = numberOfDice * 6
    return .generate(lowestValue: lowestValue, highestValue: highestValue)
}

var histogram = generateHistogram()

