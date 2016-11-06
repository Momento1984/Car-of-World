//
//  Model.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation

enum Drive{
    case Rear
    case Forward
    case Full
}
enum EngineTyp{
    case Diesel
    case Gasoline
    case Rotor
    case Hybrid
}

enum Transmission{
    case Mechanic
    case Automat
    case Variator
}

class Model{
    public var name: String
    public var yearOfIssue: Int
    public var photoName: String
    
    public var colors: [String]
    public var engineTyp: EngineTyp
    public var enginePower: Float
    public var transmission: [Transmission]
    public var drive: Drive
    public var description: String
 
    init(name: String, year: Int, photoName: String){
        self.name = name
        self.yearOfIssue = year
        self.photoName = photoName
        
        self.colors = []
        self.engineTyp = .Gasoline
        self.enginePower = 0
        self.transmission = []
        self.drive = .Forward
        self.description = ""
    }
}
