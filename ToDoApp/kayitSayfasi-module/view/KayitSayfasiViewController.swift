//
//  KayitSayfasiViewController.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import UIKit

class KayitSayfasiViewController: UIViewController {

    @IBOutlet weak var yapilacakIs: UITextField!
    var yapilacakIsKayitPresenterNesnesi: ViewToPresenterYapilacakIsKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YapilacakIsKayitRouter.createModule(ref: self)
    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        if let yapilacakIs = yapilacakIs.text {
            yapilacakIsKayitPresenterNesnesi?.ekle(yapilacak_is: yapilacakIs)
        }
    }
}
