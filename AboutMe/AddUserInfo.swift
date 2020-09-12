//
//  AddUserInfo.swift
//  AboutMe
//
//  Created by Aiur on 11.09.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import SwiftUI

struct AddUserInfo: View {
    @ObservedObject var userInfo: UserObj
    @State private var title: String = ""
    @State private var value: String = ""
    @Binding var isShowedModal: Bool
    
    struct RowView: View {
        let type: UserObj.UserObjField.Types
        @Binding var value: String
        
        var body: some View {
            HStack {
                if type == .title {
                    Text("Title: ")
                }
                if type == .value {
                    Text("Value: ")
                }
                TextField("", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    RowView(type: UserObj.UserObjField.Types.title, value: $title)
                    RowView(type: UserObj.UserObjField.Types.value, value: $value)
                }
                .padding()
                Spacer()
            }
            .navigationBarTitle("Add user info", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.userInfo.fields.append(UserObj.UserObjField(title: self.title, value: self.value))
                self.isShowedModal.toggle()
            }) {
                Text("Save")
                    .padding([.leading, .trailing], 16)
                    .padding([.top, .bottom], 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 4)
                    )
                    .cornerRadius(15)
                    .foregroundColor(.black)
                
        })
        }
    }
}

struct AddUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddUserInfo(userInfo: UserObj(), isShowedModal: Binding<Bool>.constant(true))
        }
    }
}
