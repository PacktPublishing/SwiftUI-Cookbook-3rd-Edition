//
//  ContentView.swift
//  SwiftChartsBasics
//
//  Created by Juan Catalan on 9/14/23.
//

import SwiftUI
import Charts

enum BarChartType {
    case aggregate
    case stacked
    case sideBySide
}

extension Question: Plottable {}
extension Answer: Plottable {}

struct ContentView: View {
    private var data: [SurveyEntry] = SurveyEntry.sampleSurvey
    @State private var typeOfChart: BarChartType = .aggregate
    
    var body: some View {
        VStack {
            Text("Swift Charts Basics")
                .foregroundStyle(Color.accentColor)
                .font(.title)
            Picker("Type of Chart", selection: $typeOfChart) {
                Text("Aggregate").tag(BarChartType.aggregate)
                Text("Stacked").tag(BarChartType.stacked)
                Text("Side-by-side").tag(BarChartType.sideBySide)
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            Chart {
                ForEach(data) { entry in
                    let mark = BarMark(
                        x: .value("Question", entry.question),
                        y: .value("Count", entry.count)
                    )
                    switch typeOfChart {
                    case .aggregate:
                        mark
                    case .stacked:
                        mark
                            .foregroundStyle(by: .value("Answer", entry.answer))
                    case .sideBySide:
                        mark
                            .foregroundStyle(by: .value("Answer", entry.answer))
                            .position(by: .value("Answer", entry.answer))
                    }
                }
            }
            .aspectRatio(contentMode: .fit)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
