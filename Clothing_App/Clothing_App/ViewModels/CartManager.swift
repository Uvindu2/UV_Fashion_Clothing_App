import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    // Function to add a product to the cart
    func addToCart(product: Product) {
        // Add the product to the local array
        products.append(product)
        // Update the total price
        total += product.price
        
        // Convert Product object to dictionary
        let productDict: [String: Any] = [
            "id": product.id.uuidString,
            "productId":product.id.uuidString,
            "userId":"66067dfa3fc5b5976ea87917",
            "name": product.name,
            "image": product.image,
            "price": product.price,
            "description": product.description,
            "category": product.category,
            "colour": "null",
            // Add more fields as needed
        ]
        
        // Convert dictionary to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: productDict) else {
            print("Failed to serialize product to JSON")
            return
        }
        
        // Make a POST request to your API
        guard let url = URL(string: "https://uv-fashion.onrender.com/api/cart/") else {
            print("Invalid API URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            }
            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
        }.resume()
    }
    
    // Function to remove a product from the cart
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            total -= products[index].price
            products.remove(at: index)
        }
    }
    
    func fetchCartDetails(for userId: String) {
        print(userId) // Verify that userId is correct
        
        guard let url = URL(string: "https://uv-fashion.onrender.com/api/cart/\(userId)") else {
            print("Invalid API URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching cart details: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Decode fetched cart details
            do {
                let decoder = JSONDecoder()
                let cartItems = try decoder.decode([Product].self, from: data)
                print(cartItems)
                // Update products and total
                DispatchQueue.main.async {
                    self.products = cartItems
                    self.calculateTotal()
                }
            } catch {
                print("Error decoding cart details: \(error)")
            }
        }.resume()
    }

    
    // Function to calculate total price of products
    private func calculateTotal() {
        total = products.reduce(0) { $0 + $1.price }
    }
}
