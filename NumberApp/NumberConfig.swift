//
//  NumberConfig.swift
//  NumberApp
//
//  Created by Vani on 8/29/24.
//

import Foundation

struct NumberDataModel: Codable {
    let number: Int
    let counts: [[[Int]]]
}

class DataManager {
    func loadData(fileName: String, callBack: @escaping ([NumberDataModel]?) -> Void) {
        guard let fileUrl = Bundle.main.url(forResource: "Data", withExtension: "json") else {
            callBack(nil)
            return
        }
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let numberDataModel = try JSONDecoder().decode([NumberDataModel].self, from: data)
            callBack(numberDataModel)
        } catch {
            callBack(nil)
        }
    }
}
