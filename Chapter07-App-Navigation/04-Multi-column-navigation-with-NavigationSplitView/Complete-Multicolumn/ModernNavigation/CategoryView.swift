//
//  CategoryView.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    var color: Color {
        switch category {
        case .fruit: .yellow
        case .meat: .red
        case .vegetable: .green
        }
    }

    var body: some View {
        Text(category.name)
            .foregroundStyle(.white)
            .padding(.all, 8)
            .background(color)
            .clipShape(Capsule())
    }
}

#Preview {
    VStack(spacing: 10) {
        ForEach(Category.allCases) { category in
            CategoryView(category: category)
        }
    }
}
