//
//  UserObj.swift
//  ListView
//
//  Created by Aiur on 23.08.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import Foundation
import SwiftUI

final class UserObj: ObservableObject {
//    @Published var name: String = "Max"
//    @Published var email: String = "MaxMaster@gmail.com"
    @Published var fields: [UserObjField] = []
    
    init(fields: [UserObjField]) {
        self.fields = fields
    }
    
    init() {
        fields.append(UserObjField(title: "name", value: "Vasya"))
        fields.append(UserObjField(title: "email", value: "aia@gmail.com"))
        fields.append(UserObjField(title: "phone number", value: "+89287822783"))
    }
    
    final class UserObjField: ObservableObject, Identifiable {
        
        static func == (lhs: UserObj.UserObjField, rhs: UserObj.UserObjField) -> Bool {
            if lhs.title == rhs.title && lhs.value == rhs.value {
                return true
            }
            return false
        }
        
        let id = UUID()
        @Published var title: String = "email"
        @Published var value: String = "aia@gmail.com"
        
        init(title: String, value: String) {
            self.title = title
            self.value = value
        }
    }
    
    func getField(of field: Fields) -> Fields {
        switch field {
        case .email:
            return .email
        case .name:
            return .name
        }
    }
    
//    func getFieldValue(of field: Fields) -> String {
//        switch field {
//        case .email:
//            return self.email
//        case .name:
//            return self.name
//        }
//    }
    
    enum Fields {
        case name
        case email
        
        func getFieldName() -> String {
            switch self {
            case .email:
                return "email"
            case .name:
                return "name"
            }
        }
    }
}
