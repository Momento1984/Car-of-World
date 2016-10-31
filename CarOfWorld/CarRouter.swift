//
//  CarRouter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 31.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
protocol RouterDelegate{
    func openModelsModuleForBrand(brand: Brand)
}
class CarRouter: RouterDelegate{
    static var shared:CarRouter?{
        willSet(newValue){
            if shared == nil{
                self.shared = newValue
            }
        }
    }
    init() {
        CarRouter.shared = self
    }
    public func openModelsModuleForBrand(brand: Brand) {
        
    }

    
}
