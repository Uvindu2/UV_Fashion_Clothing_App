//
//  CartView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import SwiftUI



struct CartView: View {

    @EnvironmentObject var cartManager: CartManager

    var body: some View {

        ScrollView{

            if cartManager.products.count > 0 {

                ForEach(cartManager.products, id: \.id){

                    product in

                    ProductRow(product: product)

                }

                

                HStack{

                    Text("Your cart total is")

                    Spacer()

                    Text("Rs \(cartManager.total).00")

                        .bold()

                }

                .padding()

                

                //PaymentButton(action:{})

                    .padding()

            }else{

                Text("Your cart is empty")

            }

        }

        .navigationTitle("My Cart")

        .padding(.top)

    }

}



struct CartView_Previews: PreviewProvider{

    static var previews: some View{

        CartView()

            .environmentObject(CartManager())

        

    }

}


