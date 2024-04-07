import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @StateObject var viewModel = ProductViewModel()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    let categories: [Category] = [
        Category(name: "Men", systemImageName: "person"),
        Category(name: "Women", systemImageName: "person.fill"),
        Category(name: "Kids", systemImageName: "person.3"),
        Category(name: "Office", systemImageName: "bag")
    ]
    
    @State private var isCategorySelected = false
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        
        NavigationView {

            VStack(alignment: .leading) {
                Text("UV Fashion")
                    .foregroundStyle(Color.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                                isCategorySelected = true
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
                    .padding(.horizontal, 10)
                }
                
                NavigationLink(
                    destination: CategoryProductsView(products: filteredProducts(for: selectedCategory)),
                    isActive: $isCategorySelected,
                    label: { EmptyView() }
                )
                .hidden()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.productList.filter { $0.id != nil }, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }


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
         
        }
        
        .onAppear {
            viewModel.fetchProductsFromAPI()
            cartManager.fetchCartDetails(for: "66067dfa3fc5b5976ea87917")
        }
        .navigationViewStyle(StackNavigationViewStyle())

 
    }
    
    
    
    // Function to filter products for the selected category
    private func filteredProducts(for category: Category?) -> [Product] {
        guard let category = category else {
            return viewModel.productList // If no category selected, return all products
        }
        return viewModel.productList.filter { $0.category == category.name }
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


