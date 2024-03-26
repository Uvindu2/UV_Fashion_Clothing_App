//
//  ProductViewModel.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-25.
//


import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var selectedProduct: Product?
    @Published var shouldNavigate: Bool = false
}

