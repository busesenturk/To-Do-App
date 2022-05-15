//
//  DetaySayfasiViewController.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import UIKit

class DetaySayfasiViewController: UIViewController {

    @IBOutlet weak var yapilacakIs: UITextField!
    
    var yapilacaklar: Yapilacaklar?
    var isDetayPresenterNesnesi: ViewToPresenterIsDetayProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yapilacaklar {
            yapilacakIs.text = y.yapilacak_is
        }
        DetaySayfasiRouter.createModule(ref: self)
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let yi = yapilacakIs.text, let y = yapilacaklar {
            isDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
    }
}
