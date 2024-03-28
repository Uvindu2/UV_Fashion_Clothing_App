//
//  Product.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import Foundation

struct Product: Identifiable, Decodable { // Ensure Product conforms to Decodable
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description:String
    var category:String
}

// Other parts of your code remain the same


let productList = [
    Product(name: "Orange sweater", image: "dress1", price: 54, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Men"),
    Product(name: "Red wine sweater", image: "dress2", price: 89, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Women"),
    Product(name: "Sand sweater", image: "dress3", price: 79, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Men"),
    Product(name: "Sea sweater", image: "dress4", price: 94, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Women"),
    Product(name: "Cream sweater", image: "dress5", price: 99, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Kids"),
    Product(name: "Beige sweater", image: "dress6", price: 65, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Kids"),
    Product(name: "Grey sweater", image: "dress7", price: 54, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Kids"),
    Product(name: "Mink sweater", image: "dress1", price: 83, description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", category: "Office")
]


