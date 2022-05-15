//
//  YapilacakIsKayitPresenter.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import Foundation

class YapilacakIsKayitPresenter: ViewToPresenterYapilacakIsKayitProtocol {
    var yapilacakIsKayitInteractor: PresenterToInteractorYapilacakIsKayitProtocol?
    
    func ekle(yapilacak_is: String) {
        yapilacakIsKayitInteractor?.yapilacakIsEkle(yapilacak_is: yapilacak_is)
    }
    
    
}
