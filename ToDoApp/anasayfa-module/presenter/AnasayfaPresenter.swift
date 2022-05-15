//
//  AnasayfaPresenter.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

class AnasayfaPresenter: ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yapilacakIsleriYukle() {
        anasayfaInteractor?.tumyapilacakIsleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yapilacakIsAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yapilacak_id: Int) {
        anasayfaInteractor?.yapilacakIsSil(yapilacak_id: yapilacak_id)
    }
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGönder(yapilacakIslerListesi yapilacaklarListesi: Array<Yapilacaklar>) {
        anasayfaView?.vieweVeriGönder(yapilacakIslerListesi: yapilacaklarListesi)
    }
}
