//
//  ViewController.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import UIKit

class AnasayfaViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacakIslerTableView: UITableView!
    
    var yapilacakIslerListe = [Yapilacaklar]()
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        yapilacakIslerTableView.delegate = self
        yapilacakIslerTableView.dataSource = self
        veriTabaniKopyala()
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yapilacakIsleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yapilacaklar = sender as? Yapilacaklar {
                let gidilecekVC = segue.destination as! DetaySayfasiViewController
                gidilecekVC.yapilacaklar = yapilacaklar
            }
        }
    }
    
    func veriTabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "yapacaklarim", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapacaklarim.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch { }
        }
    }
}

extension AnasayfaViewController: PresenterToViewAnasayfaProtocol {
    func vieweVeriGönder(yapilacakIslerListesi: Array<Yapilacaklar>) {
        self.yapilacakIslerListe = yapilacakIslerListesi
        self.yapilacakIslerTableView.reloadData()
    }
}

extension AnasayfaViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
        
    }
}

extension AnasayfaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacakIslerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacakIs = yapilacakIslerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacakIslerHucre", for: indexPath) as! yapilacakIsTableViewCell
        hucre.yapilacakIsInfoLabel.text = "\(yapilacakIs.yapilacak_is ?? "")"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (action, view, bool) in
            let yapilacakIs = self.yapilacakIslerListe[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacakIs.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: yapilacakIs.yapilacak_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacakIs = yapilacakIslerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacakIs)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

