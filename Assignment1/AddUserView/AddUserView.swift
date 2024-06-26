//
//  AddUserView.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 26/06/24.
//

import SwiftUI

struct AddUserView: View {
    var title: String = "Add User"
    var isEditEnabled : Bool = false
    var userModel: DashboardModel?
    @State var username: String = ""
    @State var gender: Gender = .male
    @Binding var isDismiss: Bool
    var onAdd: (DashboardModel) -> Void = { _ in }
    
    var body: some View {
        VStack {
            Text(title)
                .fixedSize()
                .font(.system(size: 18, weight: .bold))
                .padding(.top)
            HStack(spacing:6) {
                TextField(text: $username) {
                    Text("\(isEditEnabled ? userModel?.name ?? "" : "Username")")
                        .font(.system(size: 16, weight: .bold))
                        .fontDesign(.rounded)
                }.textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    if !username.isEmpty {
                        if isEditEnabled, var model = userModel {
                            model.name = username
                            model.gender = gender
                            self.onAdd(model)
                        }else {
                            var model = DashboardModel(name: username)
                            model.gender = gender
                            self.onAdd(model)
                        }
                        self.isDismiss = false
                    }
                }
                .frame(width: 50,height: 50)
                .foregroundColor(.white)
                .background(Color.blue.opacity(0.5))
                .clipShape(Circle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            Spacer()
            RadioView(selectedGender: isEditEnabled ? userModel?.gender ?? .male : gender, gender: $gender)
            Spacer()
        }
        .frame(width: 350, height: 200)
        .presentationCornerRadius(10)
        .background(.gray.opacity(1))
    }
    
}

#Preview {
    AddUserView(isDismiss: Binding<Bool>.constant(false))
}

struct RadioView: View {
   @State var selectedGender : Gender
   @Binding var gender : Gender
    var body: some View {
        HStack() {
            let selected = "circle.inset.filled"
            let unselected = "circlebadge"
            
            Button("Male", systemImage: selectedGender == .male ? selected : unselected ) {
                gender = .male
                selectedGender = .male
            }
            .tint(.black)
            Button("Female", systemImage: selectedGender == .female ? selected : unselected ) {
                gender = .female
                selectedGender = .female
            }.tint(.black)
        }
        .frame(width: 200)
        .padding()
    }
}
