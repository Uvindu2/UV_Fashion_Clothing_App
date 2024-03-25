//
//  Product.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Orange sweater", image: "dress1", price: 54),
                   Product(name: "Red wine sweater", image: "dress2", price: 89),
                   Product(name: "Sand sweater", image: "dress3", price: 79),
                   Product(name: "Sea sweater", image: "dress4", price: 94),
                   Product(name: "Cream sweater", image: "dress5", price: 99),
                   Product(name: "Beige sweater", image: "dress6", price: 65),
                   Product(name: "Grey sweater", image: "dress7", price: 54),
                   Product(name: "Mink sweater", image: "dress1", price: 83)]
