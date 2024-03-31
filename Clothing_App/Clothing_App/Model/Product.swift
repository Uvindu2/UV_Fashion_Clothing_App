//
//  Product.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import Foundation

struct Product: Identifiable, Decodable {
   
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
    var category: String
    
    enum CodingKeys: String, CodingKey {
        case name, image, price, description, category
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.price = try container.decode(Int.self, forKey: .price)
        self.description = try container.decode(String.self, forKey: .description)
        self.category = try container.decode(String.self, forKey: .category)
    }
}

// Other parts of your code remain the same
let viewModel=ProductViewModel()
let productList=viewModel.productList;




