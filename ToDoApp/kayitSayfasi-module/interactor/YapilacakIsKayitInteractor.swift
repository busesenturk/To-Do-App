//
//  YapilacakIsKayitInteractor.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import Foundation

class YapilacakIsKayitInteractor: PresenterToInteractorYapilacakIsKayitProtocol {
    
    let db: FMDatabase?
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapacaklarim.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func yapilacakIsEkle(yapilacak_is: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO yapacaklarimListesi (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
