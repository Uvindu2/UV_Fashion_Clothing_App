//
//  CartManager.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    
    
    // Functions to add and remove from cart
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
}
