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
    func viewDidAppearWithPresenter(presenter: CommonPresenterDelegate)
    func closeView(view: UIViewController)
}
class CarRouter: RouterDelegate{
    
    private struct StoryBoardSeguesIdent{
        static let OpenModels = "Open models"
        static let OpenCars = "Open car"
        static let AddNewBrand = "Add new brand"
        static let AddNewModel = "Add new model"
    }
    static let shared = CarRouter()
    
    public var currentPresenter: CommonPresenterDelegate?
    
    
    private init(){
        print("Router created")

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
            case StoryBoardSeguesIdent.OpenModels:
                let mtvc = segue.destination as! ModelsTableViewController
                if let brand = (currentPresenter as! BrandPresenter).selectedBrand{
                    mtvc.presenter = ModelPresenter(brand:brand)
                    currentPresenter = mtvc.presenter
            
                }
            case StoryBoardSeguesIdent.OpenCars:
                let ctvc = segue.destination as! CarTableViewController
                if let model = (currentPresenter as! ModelPresenter).selectedModel{
                    ctvc.presenter = CarPresenter(model:model)
                    //currentPresenter = ctvc.presenter

                }
                
            case StoryBoardSeguesIdent.AddNewBrand:
                let nbvc = segue.destination as! NewBrandViewController
                nbvc.title = "Новая марка"
                nbvc.presenter = NewBrandPresenter()
                /*if let model = (currentPresenter as! ModelPresenter).selectedModel{
                    //nbvc.presenter = NewBrandPresenter()
                    
 
                }*/
            default: print("Error segue ident name = \(ident)")
                
            }
        }
    }
    
    func viewDidAppearWithPresenter(presenter: CommonPresenterDelegate){
        currentPresenter = presenter
    }
    
    func closeView(view: UIViewController){
        view.navigationController?.popViewController(animated: true)
    }

    
}
