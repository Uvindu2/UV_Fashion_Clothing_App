//
//  CategoryButtonView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-25.
//

import SwiftUI

struct CategoryButtonView: View {
    let category: Category
    
    var body: some View {
        VStack {
            Image(systemName: category.systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text(category.name)
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(width: 80, height: 80)
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
}

