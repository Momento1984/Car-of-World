//
//  NewBrandPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 12.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit

class NewBrandPresenter: NewBrandViewDelegate{
    private let interactor: CarsInteractor
    private let router: CarRouter
    
    public init(){
        print("NewBrand presenter created")
        
        self.interactor = CarsInteractor.shared
        self.router = CarRouter.shared
    }
    
    public weak var view: UIViewController?
    
    internal func getView() -> UIViewController? {
        return view
    }

    
    func addBrandWithName(name: String, andYear year: Int){
        if (year >= 1900) && (year <= 2030){
            if !name.isEmpty{
                interactor.brands.append(Brand(name: name, year: year))
                router.closeView(view: view!)
            }
        }
        
    }
    
    deinit{
        print("NewBrand presenter good bay!")
    }
}
