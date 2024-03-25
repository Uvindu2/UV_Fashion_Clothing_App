//
//  HeaderView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import SwiftUI

struct HeaderView: View {
    var menuAction:ButtonAction
    var cartAction:ButtonAction
    var body: some View {
        ZStack{
            HStack{
                Button{
                    menuAction()
                } label:{
                    Image("Menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width:24,height:24)
                .frame(maxWidth:.infinity,alignment:.leading)
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 84,height: 84)
                Button{
                    
                }label: {
                  Image("shopping bag")
                        .resizable()
                    
                }
            }
        }
    }
}

#Preview {
    HeaderView()
}
