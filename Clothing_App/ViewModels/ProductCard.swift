//
//  ProductCard.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

//import SwiftUI
//
//
//struct ProductCard:View {
//    @EnvironmentObject var cartManager:CartManager
//    var product:ProductCard
//    
//    var body:some View{
//        ZStack(alignment: .topTrailing) {
//            ZStack(alignment: .bottom) {
//                Image(product.image)
//                    .resizable()
//                    .cornerRadius(20)
//                    .frame(width:180)
//                    .scaledToFit()
//                VStack(alignment:.leading){
//                    Text(product.name)
//                        .bold()
//                    Text("\(product.price)$")
//                        .font(.caption)
//                }
//                .padding()
//                .frame(width:180,alignment: .leading)
//                .cornerRadius(3)
//                
//                Button{
//                    cartManager.addToCart(product:product)
//                }label:{
//                    Image(systemName: "plus")
//                        .padding(10)
//                        .foregroundStyle(.white)
//                        .background(.black)
//                        .cornerRadius(50)
//                        .padding()
//                    
//                }
//            }
//        }
//    }
//    struct ProductCard_Previews: PreviewProvider {
//        static var previews: some View {
//            ProductCard(product: productList[0])
//                .environmentObject(CartManager())
//        }
//    }
//    
//    
//    
//}
import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    @StateObject var viewModel = ProductViewModel()
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            NavigationLink(destination: ProductOneDetailView(product: product), isActive: $viewModel.shouldNavigate) {
                ZStack(alignment: .bottom) {
                    Image(product.image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .bold()
                        
                        Text("\(product.price)$")
                            .font(.caption)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
                .onTapGesture {
                    viewModel.selectedProduct = product
                    viewModel.shouldNavigate = true
                }
            }
                .frame(width: 180, height: 250)
                .shadow(radius: 3)
                
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding()
                }
            }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
