//
//  DBManager.swift
//  NumberApp
//
//  Created by Vani on 8/30/24.
//

import Foundation

/*
 {
   "number": 876,
   "counts":
     {
       "2": [
         [526, 350],
         [354, 522],
         [112, 764]
       ],
       "3": [
         [200, 376, 300],
         [120, 498, 258],
         [650, 120, 106]
       ],
       "4": [
         [127, 248, 371, 130],
         [207, 168, 315, 186],
         [410, 108, 216, 142]
       ],
       "5": [
         [116, 187, 296, 120, 157],
         [213,  90, 173, 240, 160],
         [161, 142, 173, 190, 210]
       ]
   }
 },
 */
struct numCount: Codable {
    let two : [[Int]]
    let three : [[Int]]
    let four : [[Int]]
    let five : [[Int]]
     
    enum CodingKeys: String, CodingKey {
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
    }
}

struct NumberDataModel: Codable {
    let number: Int
    let counts: numCount
}

final class DBManager {

    static let shared = DBManager()

    private init() {

    }
    func loadData(fileName: String, callBack: @escaping ([NumberDataModel]?) -> Void) {
        guard let fileUrl = Bundle.main.url(forResource: "Data", withExtension: "json") else {
            callBack(nil)
            return
        }

        do {
            let data = try Data(contentsOf: fileUrl)
            let numberDataModel = try JSONDecoder().decode([NumberDataModel].self, from: data)
            callBack(numberDataModel)
            print(data)
        } catch {
            print(error.localizedDescription)
            callBack(nil)
        }
    }
}

