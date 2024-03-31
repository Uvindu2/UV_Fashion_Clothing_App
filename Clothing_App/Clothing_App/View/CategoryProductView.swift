//
//  CategoryProductView.swift
//  Clothing_App
//
//  Created by NIBMPC04PC02 on 2024-03-27.
//

import SwiftUI

struct CategoryProductsView: View {
    @StateObject var cartManager = CartManager()
    let products: [Product]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                ForEach(products, id: \.id) { product in
                    ProductCard(product: product)
                        .environmentObject(cartManager)
                }
            }
            .padding()
            .toolbar {
                NavigationLink(
                    destination: CartView().environmentObject(cartManager),
                    label: {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                )
            }
        }
        .navigationTitle("Products")
    }
}
