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
            //nextPresenter = ModelPresenter(brand: brand)
            view.performSegue(withIdentifier: "Open models", sender: nextPresenter)
        }
        /*if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            if let navCon = appDelegate.window?.rootViewController as! UINavigationController?{
                let mtvc = ModelsTableViewController()
                mtvc.presenter = nextPresenter as! ModelViewDelegate?
                navCon.pushViewController(mtvc, animated: true)
            }
        }*/
    }
    public func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let ident = segue.identifier{
            switch ident {
            case "Open models":
                let mtvc = segue.destination as! ModelsTableViewController
                if let brand = (currentPresenter as! BrandPresenter).selectedBrand{
                    mtvc.presenter = ModelPresenter(brand:brand)
                    
                }
                
            default: print("Error segue ident name = \(ident)")
                
            }
        }
    }
    
}
