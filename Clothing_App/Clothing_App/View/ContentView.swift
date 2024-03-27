//
//  ContentView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-16.
//

//import SwiftUI
//
//struct ContentView: View {
//    @StateObject var cartManager=CartManager()
//    var columns=[GridItem(.adaptive(minimum: 160, maximum: 20))]
//
//    var body: some View {
//        NavigationView{
//            ScrollView{
//                LazyVGrid(columns:columns,spacing: 20){
//                    ForEach(productList,id:\.id){
//                        product in ProductCard(product:product)
//                            .environmentObject(CartView(cartManager))
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle(Text("Sweater Shop"))
//            .toolbar{
//                NavigationLink{
//                    CartView()
//                        .environmentObject(cartManager)
//                } label: {
//                    CartButton(numberOfProducts:cartManager.products.count)
//                }
//            }
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    let categories: [Category] = [
        Category(name: "Men", systemImageName: "person"),
        Category(name: "Women", systemImageName: "person.fill"),
        Category(name: "Kids", systemImageName: "person.3"),
        Category(name: "Office", systemImageName: "bag")
    ]
         @State private var selectedCategory: Category? = nil
         @State private var filteredProducts: [Product] = []
    var body: some View {
        VStack(alignment:.leading){
            Text("UV Fashion")
                .foregroundStyle(Color.black)
                .font(.largeTitle)
                .fontWeight(.bold)
           
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                            filteredProducts = productList.filter { $0.category == category.name }
                            print(filteredProducts)
                        }) {
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
                }
            }

            
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                 
                }
               
                .toolbar {
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
struct Category: Hashable {
    let name: String
    let systemImageName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
