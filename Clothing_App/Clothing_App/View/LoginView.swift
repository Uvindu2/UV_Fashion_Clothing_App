//
//  LoginView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//
//
//import SwiftUI
//
//struct LoginView: View {
//    @ObservedObject var viewModel: LoginViewModel
//    @State private var loggedIn: Bool = false
//    var body: some View {
//        ZStack {
//            VStack(alignment: .leading,spacing:10) {
//                Spacer()
//                
//                Text("Login")
//                    .font(.largeTitle)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .padding()
//                TextField("Username", text: $viewModel.username)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(8)
//                    .padding(.horizontal, 10)
//                
//                SecureField("Password", text: $viewModel.password)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(8)
//                    .padding(.horizontal, 10)
//                    .padding(.bottom, 20)
//                Button(action: {
//                    // Call the login function in the ViewModel
//                    let success = viewModel.login()
//                    if success {
//                        print("Login successful")
//                        self.loggedIn = true
//                    } else {
//                        // Handle failed login
//                        print("Login failed")
//                    }
//                }) {
//                    Text("Login")
//                        .padding()
//                    
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .font(.system(size: 24, weight: .bold))
//                        .padding(.horizontal, 10)
//                }
//                .padding(.bottom, 10)
//                
//                HStack{
//                    NavigationLink(destination: SignUpView()) {
//                        Text("Sign Up")
//                            .padding(.horizontal, 12)
//                        
//                    }
//                    Spacer()
//                    NavigationLink(destination: ForgotPasswordView()) {
//                        Text("Forgot Password?")
//                            .padding(.horizontal, 12)
//                            .foregroundColor(.blue).opacity(0.9)
//                            .fontWeight(.regular)
//                    }
//                }
//                .padding(.bottom, 40)
//                .foregroundColor(.white)
//                
//                VStack(spacing: 20) {
//                    
//                    
//                    Button(action: {
//                        
//                    }) {
//                        HStack {
//                            Image("google_icon")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 80, height: 22) // Adjust icon size as needed
//                            Text("Continue with Google")
//                                .foregroundColor(.black)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(8)
//                    }
//                    
//                    Button(action: {
//                        // Handle Facebook login action
//                    })  {
//                        HStack {
//                            Image("facebook_icon")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 20, height: 20)
//                                .alignmentGuide(.leading) { _ in -30 }
//                            Text("Continue with Facebook")
//                                .foregroundColor(.white)
//                            
//                            
//                            
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                        
//                    }
//                }
//                
//                Spacer()
//                Spacer()
//                Spacer()
//                
//            }
//            
//            .padding(.horizontal, 20)
//            .background(Color.mint)
//            .bold()
//            
//            
//            NavigationLink(
//                destination: ContentView(),
//                isActive: $loggedIn,
//                label: { EmptyView() }
//            )
//        }
//                .navigationBarHidden(true)
//            
//        
//    }
//    
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(viewModel: LoginViewModel())
//    }
//}
//
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel2
    @State private var showAlert = false // State variable to control alert
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Login") {
                    if viewModel.login(user: User2(username: viewModel.username, password: viewModel.password)) {
                        // Navigate to home page upon successful login
                        // For demo, just show alert
                        showAlert=false
                        isLoggedIn = true
                   
                    } else {
                        // Show alert for invalid credentials
                        showAlert = true
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Login")
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

struct LoginView_Previews2: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel2())
    }
}
