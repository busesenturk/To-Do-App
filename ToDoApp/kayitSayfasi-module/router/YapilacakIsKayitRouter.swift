//
//  YapilacakIsKayitRouter.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 13.05.2022.
//

import Foundation

class YapilacakIsKayitRouter: PresenterToRouterYapilacakIsKayitProtocol {
    static func createModule(ref: KayitSayfasiViewController) {
        ref.yapilacakIsKayitPresenterNesnesi = YapilacakIsKayitPresenter()
        ref.yapilacakIsKayitPresenterNesnesi?.yapilacakIsKayitInteractor = YapilacakIsKayitInteractor()
    }
}
