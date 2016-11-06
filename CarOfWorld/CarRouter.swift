//
//  CarRouter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 31.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit
protocol RouterDelegate: class{
    func openModelsModuleForBrand(brand: Brand)
    func openCarModuleForModel(model: Model)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
class CarRouter: RouterDelegate{
    
    
    static let shared = CarRouter()
    
    public var currentPresenter: CommonViewDelegate?
    private var nextPresenter: CommonViewDelegate?
    
    private init(){
        //currentPresenter = BrandPresenter()
        
    }
    
    public func openModelsModuleForBrand(brand: Brand) {
        
        if let view = currentPresenter?.getView(){
            view.performSegue(withIdentifier: "Open models", sender: currentPresenter)
        }
    }
    
    public func openCarModuleForModel(model: Model) {
        
        if let view = currentPresenter?.getView(){
            view.performSegue(withIdentifier: "Open car", sender: currentPresenter)
        }
    }
    
    public func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let ident = segue.identifier{
            switch ident {
            case "Open models":
                let mtvc = segue.destination as! ModelsTableViewController
                if let brand = (currentPresenter as! BrandPresenter).selectedBrand{
                    mtvc.presenter = ModelPresenter(brand:brand)
                    currentPresenter = mtvc.presenter
            
                }
            case "Open car":
                let ctvc = segue.destination as! CarTableViewController
                if let model = (currentPresenter as! ModelPresenter).selectedModel{
                    ctvc.presenter = CarPresenter(model:model)
                    //currentPresenter = ctvc.presenter

                }
                
            default: print("Error segue ident name = \(ident)")
                
            }
        }
    }
    
}
