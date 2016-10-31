//
//  BrandPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit
protocol CommonViewDelegate{
    func getImageForIndex(index: Int) -> UIImage?
    func getNameForIndex(index: Int) -> String?
    func getYearOfIssueForIndex(index: Int) -> Int?
    func getCountList() -> Int
    
}

protocol BrandViewDelegate: CommonViewDelegate{
   func selectItemForIndex(index: Int)
}
class BrandPresenter:BrandViewDelegate{
    
    
    private let interactor: CarsInteractor
    private let router: RouterDelegate = CarRouter.sharedRouter()
    private var selectedBrand: Brand?
    
    public init(interactor: CarsInteractor){
        self.interactor = interactor
        router =
    }

    public func getYearOfIssueForIndex(index: Int) -> Int? {
        if index < self.interactor.brands.count{
            return self.interactor.brands[index].yearOfIssue
        }
        else {
            return nil
        }

    }

    public func getImageForIndex(index: Int) -> UIImage? {
        if index < self.interactor.brands.count{
            let nameImage = self.interactor.brands[index].name + "-logo"
            return UIImage(named: nameImage)
        }
        else {
            return nil
        }
    }

    public func getNameForIndex(index: Int) -> String?{
        if index < self.interactor.brands.count{
            return self.interactor.brands[index].name
        }
        else {
            return nil
        }
    }
    
    public func getCountList() -> Int{
        return self.interactor.brands.count
    }
    
    public func selectItemForIndex(index: Int){
        if index < self.interactor.brands.count{
            selectedBrand = self.interactor.brands[index]
        }
        else {
            selectedBrand = nil
        }

    }
}
