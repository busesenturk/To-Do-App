//
//  DetaySayfasiProtocol.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

protocol ViewToPresenterIsDetayProtocol {
    var isDetayInteractor: PresenterToInteractorIsDetayProtocol? { get set }
    func guncelle(yapilacak_id: Int, yapilacak_is: String)
}

protocol PresenterToInteractorIsDetayProtocol {
    func isGuncelle(yapilacak_id: Int, yapilacak_is: String)
}

protocol PresenterToRouterIsDetayProtocol {
    static func createModule(ref: DetaySayfasiViewController)
}
