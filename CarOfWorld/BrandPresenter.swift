//
//  BrandPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit
protocol CommonViewDelegate: class{
    func getView()->UIViewController?
    func getImageForIndex(index: Int) -> UIImage?
    func getNameForIndex(index: Int) -> String?
    func getYearOfIssueForIndex(index: Int) -> Int?
    func getCountList() -> Int
    func nextViewDetailForIndex(index: Int)
    
}

protocol BrandViewDelegate: CommonViewDelegate{
   func selectItemForIndex(index: Int)
}
class BrandPresenter:BrandViewDelegate{
    
    
    private let interactor: CarsInteractor
    private weak var router: RouterDelegate?
    public var selectedBrand: Brand?
    public var view: UIViewController?
    
    public init(){
        self.interactor = CarsInteractor.shared
        self.router = CarRouter.shared
    }

    public func getView()->UIViewController?{
        return view
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
    func nextViewDetailForIndex(index: Int){
        if index < self.interactor.brands.count{
            router?.openModelsModuleForBrand(brand: self.interactor.brands[index])
        }
    }
}
