//
//  GameViewModelDelegate.swift
//  NumberApp
//
//  Created by Vani on 9/5/24.
//

import Foundation

protocol GameViewModelDelegate: AnyObject {

    func didUpdateTargetNum(_ targetNum: String)
    func didUpdateCountNum(_ countNum: String)
    func didUpdateSumValues(_ sumText: String)
    func didUpdateResult(_ result: Bool)
    
}
