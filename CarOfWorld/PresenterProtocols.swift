//
//  PresenterProtocols.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 12.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit
protocol CommonPresenterDelegate: class{
    func getView()->UIViewController?
}
protocol TablePresenterDelegate: CommonPresenterDelegate{
    func getImageForIndex(index: Int) -> UIImage?
    func getNameForIndex(index: Int) -> String?
    func getYearOfIssueForIndex(index: Int) -> Int?
    func getCountList() -> Int
    func nextViewDetailForIndex(index: Int)
    func selectItemForIndex(index: Int)
    func addNewItem()
    
}

protocol BrandViewDelegate: TablePresenterDelegate{
}

protocol ModelViewDelegate: TablePresenterDelegate{
    func getName()->String?
    
}

protocol CarViewDelegate: CommonPresenterDelegate{
    func getView()->UIViewController?
    func getImage() -> UIImage?
    func getName() -> String?
    func getBrandName() -> String?
    func getYearOfIssue() -> Int?
    func getEngineTyp() -> String?
    func getEnginePower() -> Float?
    func getColorForIndex(index: Int) -> UIColor?
    func getTransmission() -> String?
    func getDrive() -> String?
    func getDescription() -> String?
    
    
}
