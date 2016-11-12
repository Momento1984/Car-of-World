//
//  ModelPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 31.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit


class ModelPresenter:ModelViewDelegate{
    

    private let interactor: CarsInteractor
    private weak var router: RouterDelegate?
    private var brand: Brand?
    public var selectedModel: Model?

    public weak var view: UIViewController?
    
    
    public init(brand: Brand){
        print("Model presenter created")

        self.router = CarRouter.shared
        self.brand = brand
        self.interactor = ((UIApplication.shared.delegate as? AppDelegate)?.carsInteractor)!
    }
    public func getName()->String?{
        return brand?.name
    }

    public func getView() -> UIViewController? {
        return view
    }
    public func getYearOfIssueForIndex(index: Int) -> Int? {
        if let models = brand?.models{
            if index < models.count{
                return models[index].yearOfIssue
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    public func getImageForIndex(index: Int) -> UIImage? {
        if let models = brand?.models{
            if index < models.count{
                let nameImage = models[index].photoName
                return UIImage(named: nameImage)
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    public func getNameForIndex(index: Int) -> String?{
        if let models = brand?.models{
            if index < models.count{

                return models[index].name
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    public func getCountList() -> Int{
        if let models = brand?.models{
            return models.count
        }
        else{
            return 0;
        }
    }
    
    public func selectItemForIndex(index: Int){
        if let models = brand?.models{
            if index < models.count{
                selectedModel = models[index]
            }
        }
        else {
            selectedModel = nil
        }
        
    }
    
    
    public func nextViewDetailForIndex(index: Int){
        if let models = brand?.models{
            if index < models.count{
                router?.openCarModuleForModel(model: models[index])
            }
        }
    }

    
    deinit{
        print("Model presenter good bay!")
    }

}
