//
//  CarPresenter.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 06.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
import UIKit


class CarPresenter:CarViewDelegate{
    internal func getEnginePower() -> Float? {
        return model?.enginePower
    }

    internal func getDescription() -> String? {
        return model?.description
    }

    internal func getDrive() -> String? {
        if let drive = model?.drive{
            switch drive {
            case .Forward:
                return "Передний"
            case .Rear:
                return "Задний"
            case .Full:
                return "Полный"
            }
        }
        return nil
    }

    internal func getTransmission() -> String? {
        var str = ""
        if let transmission = model?.transmission{
            for (index, trans) in transmission.enumerated(){
                switch trans {
                case .Automat:
                    str += "АКП"
                case .Mechanic:
                    str += "МКП"
                case .Variator:
                    str += "ВР"
                }
                if index < transmission.count - 1{
                    str += "|"
                    
                }
            }
        }
        
        return str
    }

    

    
    private let interactor: CarsInteractor
    private var model: Model?
    public weak var view: UIViewController?
    
    public init(model: Model){
        print("Car presenter created")

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
    
    internal func getColorForIndex(index: Int)->UIColor? {
        var col: UIColor? = nil;
        if index < (model?.colors.count)!{
            if let color = model?.colors[index]{
                
                switch (color){
                case "red":
                    col = UIColor.red
                case "green":
                    col = UIColor.green
                case "black":
                    col = UIColor.black
                case "white":
                    col = UIColor.white
                case "yellow":
                    col = UIColor.yellow
                default:
                    col = nil
                }
                
            }
        }
        return col
    }
    internal func getView() -> UIViewController? {
        return view
    }

    func getEngineTyp() -> String?{
        if let engineTyp = model?.engineTyp{
            switch engineTyp {
            case .Diesel:
                return "Дизельный"
            case .Gasoline:
                return "Бензиновый"
            case .Rotor:
                return "Роторный"
            case .Hybrid:
                return "Гибридный"
            }
            
        }
        return nil
    }
    
    func getBrandName() -> String?{
        return interactor.getBrandForModel(model: model!)?.name
    }


    deinit{
        print("Car presenter good bay!")
    }

}
