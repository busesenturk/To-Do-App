//
//  DetaySayfasiRouter.swift
//  ToDoApp
//
//  Created by Buse Şentürk on 14.05.2022.
//

import Foundation

class DetaySayfasiRouter: PresenterToRouterIsDetayProtocol {
    static func createModule(ref: DetaySayfasiViewController) {
        ref.isDetayPresenterNesnesi = DetaySayfasiPresenter()
        ref.isDetayPresenterNesnesi?.isDetayInteractor = DetaySayfasiInteractor()
    }
}
