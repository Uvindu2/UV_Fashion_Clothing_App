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
    @State var maxCircleHeight:CGFloat=0
    
    @ObservedObject var viewModel: LoginViewModel
    @State private var showAlert = false // State variable to control alert
    @State private var isLoggedIn = false
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader { proxy in
                    let height = proxy.size.height
                    
                    
                    ZStack {
                        Circle()
                            .frame(width: height, height: height) // Example usage of the height
                            .foregroundColor(Color.black)
                            .offset(x: getReact().width / 2,y: -height/1.3)
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
                        Text("Welcome to UV Shopping")
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
                        
                        TextField("Username", text: $viewModel.username)
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
                        
                        SecureField("Password", text: $viewModel.password)
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
                    Button(action: {
                        if viewModel.login(user: User(username: viewModel.username, password: viewModel.password)) {
                            // Navigate to home page upon successful login
                            // For demo, just show alert
                            showAlert=false
                            isLoggedIn = true
                            print(isLoggedIn)
                       
                        } else {
                            // Show alert for invalid credentials
                            showAlert = true
                        }
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
                                NavigationLink(destination: SignUpNew()) {
                                    Text("Sign up")
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
                            .offset(y: getSafeArea().bottom+30)
                            .alignmentGuide(.bottom) { _ in maxCircleHeight }
                    )
                    Spacer()
                    
                }
                .padding(.top,25)
                .padding(.top,-maxCircleHeight / 1.6)
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .top)
                
            }
            
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Credentials"), message: Text("Please enter valid username and password"), dismissButton: .default(Text("OK")))
            }
            .background(
                            NavigationLink(
                                destination: ContentView(),
                                isActive: $isLoggedIn,
                                label: { EmptyView() }
                            )
                     
                        )
        }

    }
}

extension View{
    func getReact()->CGRect{
        return UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets
        ?? UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogin(viewModel: LoginViewModel())
    }
}
