//
//  NewLogin.swift
//  Clothing_App
//
//  Created by NIBMPC04PC02 on 2024-03-27.
//

import SwiftUI

struct NewLogin: View {
    @State private var email: String = ""
    @State private var npassword: String = ""
    var body: some View {
        VStack{
            GeometryReader(content: { proxy in
//                let height = proxy.frame(in: global)
                return AnyView(
        ZStack{
            
        }
       )
            })
            VStack{
                Text("Sign In")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
                    .kerning(1.9)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
                VStack(alignment: .leading, spacing: 8,content:  {
                    Text("User Name")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    TextField("email address",text: $email)
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.top,4)
                    Divider()
                    
                })
                .padding(.top,25)
                
                VStack(alignment: .leading, spacing: 8,content:  {
                    Text("Password")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    SecureField("1234567",text: $npassword)
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top,5)
                    Divider()
                    
                })
                .padding(.top,20)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Forgot password?")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                })
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.top,10)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24,weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(color:.blue.opacity(0.6), radius:5,x: 0,y: 0)
                })
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding(.top,10)
            }
            .padding(.top,25)
        }
    }
}

#Preview {
    NewLogin()
}
