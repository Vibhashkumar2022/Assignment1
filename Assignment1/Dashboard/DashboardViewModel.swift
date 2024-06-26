//
//  DashboardViewModel.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 26/06/24.
//

import Foundation

class DashboardViewModel : ObservableObject {
    
    @Published var dashboardList = [DashboardModel]()
    
    init(dashboardList: [DashboardModel]? = nil) {
        self.dashboardList = dashboardList ?? []
    }
    
    func addItemToList(itemModel: DashboardModel?) {
        guard let model = itemModel else {
            return
        }
        dashboardList.append(model)
    }
    
    func deleteItemFromList(itemModel: DashboardModel?) {
        guard let model = itemModel, (dashboardList).count > 0 else {
            return
        }
        if let index = dashboardList.firstIndex(where: { $0.id == model.id }) {
            dashboardList.remove(at: index)
        }
    }
    
    func updateItemFromList(itemModel: DashboardModel?) {
        guard (dashboardList).count > 0 else {
            return
        }
        if var index = dashboardList.firstIndex(where: { $0.id == itemModel?.id }), let model = itemModel {
            dashboardList[index] = model
        }
    }
    
    func getItemArray() -> [DashboardModel] {
        return dashboardList
    }
}
