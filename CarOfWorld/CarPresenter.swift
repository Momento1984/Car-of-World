//
//  CarPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 06.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit

protocol CarViewDelegate: class{
    func getView()->UIViewController?
    func getImage() -> UIImage?
    func getName() -> String?
    func getYearOfIssue() -> Int?
 
    
    
}
class CarPresenter:CarViewDelegate{
    
    private let interactor: CarsInteractor
    private var model: Model?
    public var view: UIViewController?
    
    public init(model: Model){
        self.model = model
        self.interactor = ((UIApplication.shared.delegate as? AppDelegate)?.carsInteractor)!
    }
    
    internal func getYearOfIssue() -> Int? {
        return model?.yearOfIssue
    }

    internal func getName() -> String? {
        return model?.name
    }

    internal func getImage() -> UIImage? {
        if let photoName = model?.photoName{
            return UIImage(named: photoName)
        }
        else {
            return nil
        }
    }

    internal func getView() -> UIViewController? {
        return view
    }





}
