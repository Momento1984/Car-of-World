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
        newBrand.models.append(Model(name: "Camry", year: 2001, photoName: "Camry_4"))
        newBrand.models.append(Model(name: "Corolla", year: 2002, photoName: "Corolla_1"))
        newBrand.models.append(Model(name: "Celica", year: 1999, photoName: "4f8e6bb44892f"))
        newBrand.models.append(Model(name: "Land Cruiser Prado", year: 1996, photoName: "4f8e6af0b1171"))
        brands.append(newBrand)
        
        newBrand = Brand(name: "Ferrari", year: 1929)
        newBrand.models.append(Model(name: "f430 spider", year: 2004, photoName: "ferrari-f430-spider"))
        newBrand.models.append(Model(name: "f355 spider", year: 1990, photoName: "ferrari-f430-spider"))
        newBrand.models.append(Model(name: "f599xx", year: 1984, photoName: "ferrari-599xx"))
        newBrand.models.append(Model(name: "550 moranello", year: 1991, photoName: "ferrari-550-maranello"))
        brands.append(newBrand)

        
        brands.append(Brand(name: "Porsche", year: 1931))
        brands.append(Brand(name: "Audi", year: 1909))
        brands.append(Brand(name: "Lamborghini", year: 1963))
        brands.append(Brand(name: "Volkswagen", year: 1937))
        brands.append(Brand(name: "Nissan", year: 1933))
        brands.append(Brand(name: "Mercedes-Benz", year: 1926))

    }
}
