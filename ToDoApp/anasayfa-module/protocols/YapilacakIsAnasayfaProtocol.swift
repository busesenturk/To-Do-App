//
//  YapilacakIsAnasayfaProtocol.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

// Ana Protocoller
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? { get set }
    var anasayfaView: PresenterToViewAnasayfaProtocol? { get set }
    func yapilacakIsleriYukle()
    func ara(aramaKelimesi: String)
    func sil(yapilacak_id: Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? { get set }
    func tumyapilacakIsleriAl()
    func yapilacakIsAra(aramaKelimesi: String)
    func yapilacakIsSil(yapilacak_id: Int)
}

// Taşıyıcı Protocoller
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGönder(yapilacakIslerListesi:Array<Yapilacaklar>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGönder(yapilacakIslerListesi:Array<Yapilacaklar>)
}

// Router Protocol
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaViewController)
}
