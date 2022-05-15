//
//  YapilacakIsKayitProtocols.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import Foundation

// Ana Protocoller
protocol ViewToPresenterYapilacakIsKayitProtocol {
    var yapilacakIsKayitInteractor: PresenterToInteractorYapilacakIsKayitProtocol? { get set }
    func ekle(yapilacak_is: String)
}

protocol PresenterToInteractorYapilacakIsKayitProtocol {
    func yapilacakIsEkle(yapilacak_is: String)
}

protocol PresenterToRouterYapilacakIsKayitProtocol {
    static func createModule(ref: KayitSayfasiViewController)
}


