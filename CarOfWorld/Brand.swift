//
//  Brand.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 30.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import Foundation
class Brand{
    
    public let name: String
    public let yearOfIssue: Int
    public var models: [Model] = []
    public init (name: String, year: Int) {
        self.name = name
        self.yearOfIssue = year
        

    }
    
}
