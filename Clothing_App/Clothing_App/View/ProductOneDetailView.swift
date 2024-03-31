import SwiftUI

struct ProductOneDetailView: View {
    var product: Product // Assuming Product is your model
    @State private var selectedSize: String = "" // State to track selected size
    var body: some View {
        VStack {
            // Product Image
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            // Product Name
            Text(product.name)
                .font(.title3)
            
            // Product Price
            Text("\(product.price)$")
                .font(.title3)
                .padding()
            
            HStack {
                ForEach(["S", "M", "L", "XL", "XXL"], id: \.self) { size in
                    Button(action: {
                        selectedSize = size
                    }) {
                        Text(size)
                            .font(selectedSize == size ? .headline : .subheadline)
                            .padding(10)
                            .background(selectedSize == size ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 5)
                }
            }
            // Product Price
            Text("\(product.description)$")
                .font(.subheadline)
                .padding()
            .padding(.bottom)
            Spacer()
            Text("Add to Cart")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 10) // Adjusting horizontal padding
        
            Spacer()
        }
    }
}
