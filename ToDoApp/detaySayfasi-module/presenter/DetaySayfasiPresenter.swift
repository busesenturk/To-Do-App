//
//  DetaySayfasiPresenter.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

class DetaySayfasiPresenter: ViewToPresenterIsDetayProtocol {
    var isDetayInteractor: PresenterToInteractorIsDetayProtocol?
    
    func guncelle(yapilacak_id: Int, yapilacak_is: String) {
        isDetayInteractor?.isGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}
