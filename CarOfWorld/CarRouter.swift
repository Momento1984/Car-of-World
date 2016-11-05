//
//  CarRouter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 31.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit
protocol RouterDelegate{
    func openModelsModuleForBrand(brand: Brand)
}
class CarRouter: RouterDelegate{
    static let shared = CarRouter()
    
    private var currentPresenter: CommonViewDelegate?
    private var nextPresenter: CommonViewDelegate?
    
    public func openModelsModuleForBrand(brand: Brand) {
        nextPresenter = ModelPresenter(brand: brand)
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            if let navCon = appDelegate.window?.rootViewController as! UINavigationController?{
                let mtvc = ModelsTableViewController()
                mtvc.presenter = nextPresenter as! ModelViewDelegate?
                navCon.pushViewController(mtvc, animated: true)
            }
        }
    }

    
}
