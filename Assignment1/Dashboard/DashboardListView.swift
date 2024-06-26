//
//  DashboardListView.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 24/06/24.
//

import SwiftUI

struct DashboardListView: View {
    
    @ObservedObject var viewModel: DashboardViewModel 
    @State var dataSource: [DashboardModel]?
    @State var showPopUp = false
    @State var isEditEnabled = false
    @State var isDismiss: Bool = false
    @State var editModel : DashboardModel?
   
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        editModel = DashboardModel(name: "")
    }
    
    var body: some View {
        NavigationStack {
            Text("Dashboard")
                .toolbar {
                    Button("Add Name") {
                        showPopUp = true
                    }
                }
            ZStack {
                VStack(alignment: .leading){
                    List(getDataFromDataSource(), id: \.id) { item in
                        DashboardCardView(model: item)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    // MARK:  Edit
                                    showPopUp = false
                                    isEditEnabled = true
                                    editModel = item
                                } label: {
                                    Label("Edit", systemImage: "pencil.and.scribble")
                                }
                                .tint(.yellow)
                                Button {
                                    // MARK:  Edit
                                    self.viewModel.deleteItemFromList(itemModel: item)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)
                                
                            }
                    }.statusBar(hidden: false)
                }
                if showPopUp {
                    AddUserView(title: "Add User", isDismiss: ($showPopUp)) { model in
                        self.viewModel.addItemToList(itemModel: model)
                    }
                }
                if isEditEnabled {
                    AddUserView(title: "Edit User",isEditEnabled: true, userModel: editModel, isDismiss: ($isEditEnabled)) { model in
                        self.viewModel.updateItemFromList(itemModel: model)
                    }
                }
            }
        }
        
    }
    
    
    func getDataFromDataSource() -> [DashboardModel] {
        return viewModel.getItemArray()
    }
}

#Preview {
   
    DashboardListView(viewModel: DashboardViewModel(dashboardList: [DashboardModel(name: "Vibhash")]))
}
