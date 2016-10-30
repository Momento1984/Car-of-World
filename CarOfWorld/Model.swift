//
//  Model.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
class Model{
    public let name: String
    public let yearOfIssue: Int
    public let photoName: String

 
    init(name: String, year: Int, photoName: String){
        self.name = name
        self.yearOfIssue = year
        self.photoName = photoName
    }
}
