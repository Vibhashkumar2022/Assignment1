//
//  DashboardCardView.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 26/06/24.
//

import SwiftUI

struct DashboardCardView: View {
    let model: DashboardModel
    var body: some View {
        HStack(alignment:.center, spacing: 1) {
            Image((model.gender == .male) ? "male" : "female" ) // Replace `.building` with your image's Swift symbol
                        .resizable()
                        .frame(width: 40,height: 40)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.all)
            VStack(alignment: .leading, spacing: 8.0){
                Text("Name: \(model.name)")
                        .font(.system(size: 18,weight: .bold))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                Text("UUID: \(model.id)")
                        .font(.system(size: 12, weight: .medium))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .padding()
            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(height: 80)
        .background(Color.green.gradient.secondary)
            
    }
}

#Preview {
    DashboardCardView(model: DashboardModel(name: "Vibhash", gender: .male))
        
        
}
