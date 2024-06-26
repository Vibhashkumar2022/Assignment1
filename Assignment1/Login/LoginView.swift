//
//  ContentView.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 24/06/24.
//

import SwiftUI

struct LoginView: View {
   
    @ObservedObject var loginViewModel: LoginViewModel
    @State var userName = ""
    @State var password = ""
    @State var isPopUp : Bool = false
    @State var isValidatedSuccess : Bool = false
    @State var message : String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bgImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                ZStack(alignment: .center){
                    Color.gray.opacity(0.5)
                    VStack (){
                        Spacer(minLength: 20)
                        TitleLable(title: "Login", foregroundColor: .white, backgroundColor: .clear)
                            .frame(maxHeight: 40)
                        
                        TextField("User Id", text: $userName)
                            .textFieldStyle(.roundedBorder)
                            .textCase(.none)
                        Spacer()
                        SecureInputView.init("Password", text: $password)
                            .cornerRadius(6)
                        Spacer()
                        HStack(alignment: .center, spacing: 10.0){
                            Button("Cancel") {
                                // TODO:  Cancel action
                            }.padding(10)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(8)
                            Button("Login") {
                                isValidatedSuccess = false
                                isPopUp = false
                                validateCredentials()
                            }
                            .navigationDestination(isPresented: $isValidatedSuccess, destination: {
                                let model = DashboardModel(name: "Vibhash")
                                DashboardListView(viewModel: DashboardViewModel(dashboardList: [model]))
                            })
                            .alert(isPresented: $isPopUp) { () -> Alert in
                                Alert(title:
                                        Text(isValidatedSuccess ? "Success" : "Failed"),
                                      message:
                                        Text(isValidatedSuccess ? "" : "Invalid credential used"),
                                      primaryButton: .default(Text("Okay"), action: {
                                    isPopUp = false
                                }),
                                      secondaryButton: .default(Text("Dismiss")))
                            }
                            .padding(10)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(8)
                        }
                        Spacer()
                            .padding(10)
                    }.padding(20)
                }
                
                .frame(width: 300,height: 200)
                .cornerRadius(8)
            }
        }
        
    }
   
    func validateCredentials() {
        loginViewModel.updateUserId(userName)
        loginViewModel.updatePassword(password)
       let isValid = loginViewModel.validateUserIDpassword()
        if  isValid?.0 ?? false {
            isValidatedSuccess = true
            isPopUp = false
        }else {
            isValidatedSuccess = false
            isPopUp = true
            message = isValid?.1 ?? ""
        }
    }
}

#Preview {
    LoginView( loginViewModel: LoginViewModel())
}
