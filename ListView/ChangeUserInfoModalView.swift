//
//  ChangeUserInfoModelView.swift
//  ListView
//
//  Created by Aiur on 03.09.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import SwiftUI

struct ChangeUserInfoModalView: View {
    @Binding var isPresented: Bool
    @ObservedObject var userField: UserObj.UserObjField
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Divider()
            Text(userField.title)
            TextField("Title", text: Binding(get: {
                return self.userField.value
            }, set: { (newValue) in
                self.userField.value = newValue
            }))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            HStack {
                Spacer()
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("OK")
                }
                .frame(width: 90, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .leading, endPoint: .trailing))
                .accentColor(Color.white)
                .cornerRadius(10)
                Spacer()
            }
        }
        .frame(width: 300, height: 150)
        .padding()
        .background(Color.green)
    }
}

struct ChangeUserInfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUserInfoModalView(isPresented: Binding<Bool>.constant(true), userField: UserObj().fields.first!)
    }
}
