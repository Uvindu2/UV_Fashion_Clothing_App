//
//  RegistrationForm.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-23.
//

import SwiftUI

struct RegistrationForm: View {
    //Binding one-way
    @ObservedObject var viewModel = RegistrationViewModel()
    @State var isRegistered : Bool = false
    

    
    var body: some View{
        NavigationView {
            VStack{
                TextField("First Name",text:$viewModel.user.firstName)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("Last Name ",text:$viewModel.user.lastName)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("Email", text: $viewModel.user.email)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("User Name",text:$viewModel.user.username)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("Address",text:$viewModel.user.address)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("mobile ",text:$viewModel.user.mobile)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("Password ",text:$viewModel.user.nPassword)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                TextField("Confirm Password ",text:$viewModel.user.confirmPassword)
                    .padding()
                    .frame(maxWidth: 360, minHeight: 20)
                    .background(Color(UIColor.systemGray4))
                    .cornerRadius(10)
                Button(action: {isRegistered=false}, label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(height: 50)
                        .overlay(Text("Register").foregroundColor(.white).fontWeight(.bold).cornerRadius(60))
                    
                })
                .padding()
                NavigationLink(destination: ContentView(), isActive: $viewModel.registrationSuccess) {
                    EmptyView()
                }
                .navigationBarTitle("Registration")
                .foregroundColor(.blue)
            }
            Spacer()
            
        }
    }

}

#Preview {
    RegistrationForm()
}
