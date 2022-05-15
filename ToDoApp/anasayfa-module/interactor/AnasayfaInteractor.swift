//
//  AnasayfaInteractor.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    let db: FMDatabase?
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapacaklarim.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumyapilacakIsleriAl() {
        db?.open()
        var liste = [Yapilacaklar]()
        do {
            let rs = try db!.executeQuery("SELECT * FROM yapacaklarimListesi", values: nil)
            while rs.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            anasayfaPresenter?.presenteraVeriGönder(yapilacakIslerListesi: liste)
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func yapilacakIsAra(aramaKelimesi: String) {
        db?.open()
        var liste = [Yapilacaklar]()
        do {
            let rs = try db!.executeQuery("SELECT * FROM yapacaklarimListesi WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            while rs.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            anasayfaPresenter?.presenteraVeriGönder(yapilacakIslerListesi: liste)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func yapilacakIsSil(yapilacak_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM yapacaklarimListesi WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumyapilacakIsleriAl()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
