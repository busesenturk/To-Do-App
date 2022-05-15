//
//  DetaySayfasiInteractor.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

class DetaySayfasiInteractor: PresenterToInteractorIsDetayProtocol {
    
    let db: FMDatabase?
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapacaklarim.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func isGuncelle(yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE yapacaklarimListesi SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is, yapilacak_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
