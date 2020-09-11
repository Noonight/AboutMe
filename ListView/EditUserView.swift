//
//  ChangeUserView.swift
//  ListView
//
//  Created by Aiur on 23.08.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import SwiftUI

struct EditUserView: View {
    @EnvironmentObject var user: UserObj
    
    private struct UserFieldRow: View {
        @ObservedObject var userField: UserObj.UserObjField
        @State private var isShowModal = false
        
        var body: some View {
            HStack {
                Text(userField.title)
                Spacer()
                Text(userField.value)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding([.all], 8)
            .background(Color.white)
            .onTapGesture {
                self.isShowModal.toggle()
                print("isShowModal = \(self.isShowModal)")
            }
            .sheet(isPresented: $isShowModal) {
                ChangeUserInfoModalView(isPresented: self.$isShowModal, userField: self.userField)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(user.fields) { userField in
                UserFieldRow(userField: userField)
            }
        }
        .navigationBarTitle("Edit user info", displayMode: .inline)
    }
}

struct ChangeUserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditUserView().environmentObject(UserObj())
        }
    }
}
