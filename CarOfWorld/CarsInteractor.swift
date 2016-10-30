//
//  CarsInteractor.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation

class CarsInteractor{
    public var brands = [Brand]()
    
    public init (){
     
        var newBrand = Brand(name: "Toyota", year: 1937)
        brands.append(Brand(name: "Toyota", year: 1937))
        
        brands.append(Brand(name: "Ferrari", year: 1929))
        brands.append(Brand(name: "Porsche", year: 1931))
        brands.append(Brand(name: "Audi", year: 1909))
        brands.append(Brand(name: "Lamborghini", year: 1963))
        brands.append(Brand(name: "Volkswagen", year: 1937))
        brands.append(Brand(name: "Nissan", year: 1933))
        brands.append(Brand(name: "Mercedes-Benz", year: 1926))

    }
}
