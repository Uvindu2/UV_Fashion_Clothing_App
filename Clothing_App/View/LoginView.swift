//
//  LoginView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var loggedIn: Bool? = false
    var body: some View {
  
        ZStack {
        
            // Background color
            Color(red: 248/255, green: 248/255, blue: 248/255) // Light grey or any color relevant to your app
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading,spacing:10) { // Aligning all content to leading (left-aligned)
                Spacer()
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 10) // Adjusting horizontal padding
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 10) // Adjusting horizontal padding
                    .padding(.bottom, 20)
                Button(action: {
                    // Call the login function in the ViewModel
                    let success = viewModel.login()
                    if success {
                        // Handle successful login
                        print("Login successful")
                        self.loggedIn = true
                    } else {
                        // Handle failed login
                        print("Login failed")
                    }
                }) {
                    Text("Login")
                        .padding()
        
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.horizontal, 10) // Adjusting horizontal padding
                }
                .padding(.bottom, 10) // Adjusting bottom padding

                HStack{
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .padding(.horizontal, 12)
                        
                    }
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot Password?")
                            .padding(.horizontal, 12)
                            .foregroundColor(.blue).opacity(0.9)
                            .fontWeight(.regular)
                    }
                }
                .padding(.bottom, 40)
                .foregroundColor(.white)
                NavigationLink(destination: ContentView(), tag: true, selection: $loggedIn) {
                        EmptyView() // Use an EmptyView as the label
                    }
                    .navigationBarTitle("") // Hide the back button text
                    .navigationBarHidden(true) // Hide the navigation bar
                VStack(spacing: 20) {
                     // Other login components (e.g., username, password fields, etc.)

                     Button(action: {
                         // Handle Google login action
                     }) {
                         HStack {
                             Image("google_icon") // Replace "facebook_icon" with your actual image name
                                                     .resizable()
                                                     .aspectRatio(contentMode: .fit)
                                                     .frame(width: 80, height: 22) // Adjust icon size as needed
                                                 Text("Continue with Google")
                                                     .foregroundColor(.black)
                                             }
                         .frame(maxWidth: .infinity) // Set frame width to match the login button
                                             .padding()
                                             .background(Color.white)
                                             .cornerRadius(8)
                     }

                     Button(action: {
                         // Handle Facebook login action
                     })  {
                         HStack {
                             Image("facebook_icon") // Replace "facebook_icon" with your actual image name
                                                     .resizable()
                                                     .aspectRatio(contentMode: .fit)
                                                     .frame(width: 20, height: 20) // Adjust icon size as needed
                                                     .alignmentGuide(.leading) { _ in -30 }
                                                 Text("Continue with Facebook")
                                                     .foregroundColor(.white)
                             
                             
                                                     
                                             }
                         .frame(maxWidth: .infinity) // Set frame width to match the login button
                         .padding()
                
                                             .background(Color.blue)
                                             .cornerRadius(8)
                                             
                     }
                 }
           
                Spacer()
                Spacer()
                Spacer()
                
            }
            
            .padding(.horizontal, 20) // Adding horizontal padding to the VStack
            .background(Color.mint)
            .bold()
            
            
        }
        
  
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}

