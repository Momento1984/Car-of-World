//
//  BrandPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit
protocol BrandViewDelegate{
    func getImageLogo(index: Int) -> UIImage?
    func getName(index: Int) -> String?
    func getYearOfIssue(index: Int) -> Int?
    func getCountList() -> Int


}
class BrandPresenter:BrandViewDelegate{
    
    
    let interactor: CarsInteractor
    
    public init(interactor: CarsInteractor){
        self.interactor = interactor
    }

    func getYearOfIssue(index: Int) -> Int? {
        if index < self.interactor.brands.count{
            return self.interactor.brands[index].yearOfIssue
        }
        else {
            return nil
        }

    }

    func getImageLogo(index: Int) -> UIImage? {
        if index < self.interactor.brands.count{
            let nameImage = self.interactor.brands[index].name + "-logo"
            return UIImage(named: nameImage)
        }
        else {
            return nil
        }
    }

    func getName(index: Int) -> String?{
        if index < self.interactor.brands.count{
            return self.interactor.brands[index].name
        }
        else {
            return nil
        }
    }
    
    func getCountList() -> Int{
        return self.interactor.brands.count
    }
}
