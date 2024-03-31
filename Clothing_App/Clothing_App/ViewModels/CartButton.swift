//
//  CartButton.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import SwiftUI

struct CartButton:View{
    var numberOfProducts:Int
    @StateObject var viewModel = LoginViewModel2()
    var body:some View{

        ZStack(alignment: .topTrailing){
            Image(systemName: "cart")
                .padding(.top,5)
            if numberOfProducts>0{
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .frame(width: 15,height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }

    }
}

struct CartButton_Previews:PreviewProvider{
    static var previews: some View{
        CartButton(numberOfProducts:1)
    }
}
