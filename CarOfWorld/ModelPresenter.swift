//
//  ModelPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 31.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit

protocol ModelViewDelegate: CommonViewDelegate{
    
}
class ModelPresenter:ModelViewDelegate{
    private let interactor: CarsInteractor
    private var brand: Brand?
    
    
    public init(interactor: CarsInteractor){
        self.interactor = interactor
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
    
    func getNameForIndex(index: Int) -> String?{
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
    
    

}
