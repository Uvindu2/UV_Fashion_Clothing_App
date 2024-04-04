//
//  SignUpNew.swift
//  Clothing_App
//
//  Created by NIBMPC04PC02 on 2024-03-28.
//

import SwiftUI

struct SignUpNew: View {
    @State private var username: String = ""
    @State private var npassword: String = ""
    @State private var confirmPassword: String = ""
    @State var maxCircleHeight:CGFloat=0
    @StateObject var viewModel = LoginViewModel() 
    var body: some View {
        VStack{
            GeometryReader { proxy in
                let height = proxy.size.height
                        
                    
                ZStack {
                    Circle()
                        .frame(width: height, height: height) // Example usage of the height
                        .foregroundColor(Color.black)
                        .offset(x: getReact2().width / 2,y: -height/1.3)
                    Circle()
                        .frame(width: height, height: height) // Example usage of the height
                        .foregroundColor(Color.black)
                        .offset(x: -getReact().width / 2,y: -height/1.5)
                    Circle()
                        .frame(width: height, height: height) // Example usage of the height
                        .foregroundColor(Color(red: 120/255, green: 220/255, blue: 240/255))
                        .offset(y:-height/1.3)
                        .rotationEffect(.init(degrees: -5))
                }
                VStack{
                    Text("Sign up for Loging to the System")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .kerning(1.9)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        .padding(.top,200)
                }
            }


            .frame(maxHeight: getReact().width)
  
            VStack{
                Text("Sign Up")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
                    .kerning(1.9)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
                VStack(alignment: .leading, spacing: 8,content:  {
                    Text("Email")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    TextField("Email address",text: $username)
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
                    
                    TextField("Enter password",text: $npassword)
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.top,4)
                    Divider()
                    
                })
                .padding(.top,25)
                
                VStack(alignment: .leading, spacing: 8,content:  {
                    Text("Confirm Password")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    SecureField("Enter confirm password",text: $confirmPassword)
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top,5)
                    Divider()
                    
                })
                .padding(.top,20)
                
                Button(action: {
                    viewModel.signUp();
                   
                }, label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24,weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(color:.blue.opacity(0.6), radius:5,x: 0,y: 0)
                })
                
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding(.bottom,80)
                
                .overlay(
                    HStack{
                        Text("Already Member")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            NavigationLink(destination: NewLogin(viewModel: viewModel)) {
                                Text("Sign in")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color(red: 120/255, green: 220/255, blue: 240/255))
                            }
                            
                        })
                    }
                      
                )

                .background(
                    HStack {
                        Circle()
                            .fill(Color(red: 120/255, green: 220/255, blue: 240/255))
                            .frame(width: 70, height: 70)
                            .offset(x: -30,y: 0)
                        
                        Spacer(minLength: 0)
                        
                        Circle()
                            .fill(Color.black)
                            .frame(width: 110, height: 110)
                            .offset(x:40,y: 0)
                    
                    }
                        .offset(y: getSafeArea2().bottom+30)
                        .alignmentGuide(.bottom) { _ in maxCircleHeight }
                )
                Spacer()
                
            }
            .padding(.top,25)
            .padding(.top,-maxCircleHeight / 1.6)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .top)
            
        }

        .padding()
    }
        
}

extension View{
    func getReact2()->CGRect{
        return UIScreen.main.bounds
    }
    func getSafeArea2()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets
        ?? UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        
    }
    
}

#Preview {
    SignUpNew()
}

