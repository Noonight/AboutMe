//
//  Data.swift
//  ListView
//
//  Created by Aiur on 20.08.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import Foundation

struct Contact: Hashable, Identifiable {
    var id: Int
    var name: String
    var phoneNumber: String
    
    static func getInstance(name: String, phoneNumber: String = generateNumber()) -> Contact {
        return Contact(id: genId(), name: name, phoneNumber: phoneNumber)
    }
    
    static func getInstance(id: Int, name: String, phoneNumber: String = generateNumber()) -> Contact {
        return Contact(id: id, name: name, phoneNumber: phoneNumber)
    }
    
    private static func genId() -> Int {
        return Int.random(in: 0..<999)
    }
    
    private static func generateNumber() -> String {
        var numbers: [Int] = []
        for _ in 0...11 {
            numbers.append(Int.random(in: 0..<10))
        }
        var generatedNumber = ""
        numbers = numbers.shuffled()
        for num in numbers {
            generatedNumber.append(String(num))
        }
        return generatedNumber
    }
}

//let data = [Contact.getInstance(id: 1, name: "Vasya"), Contact.getInstance(id: 2, name: "Kolya"), Contact.getInstance(id: 3, name: "Maxim")]
let data = generateData()

func generateData() -> [Contact] {
    var data: [Contact] = []
    for i in 0...999 {
        data.append(Contact.getInstance(id: i, name: randomString(length: 10)))
    }
    return data
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
