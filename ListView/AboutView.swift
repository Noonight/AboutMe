//
//  AboutView.swift
//  ListView
//
//  Created by Aiur on 23.08.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject private var user: UserObj
    
    private struct UserFieldRow: View {
        @ObservedObject var userField: UserObj.UserObjField
        
        var body: some View {
            HStack {
                Text(userField.title)
                Spacer()
                Text(userField.value)
            }
        }
    }
    
    var body: some View {
//        NavigationView {
            List {
                ForEach(user.fields) { userField in
                    UserFieldRow(userField: userField)
                }
            }
            .navigationBarTitle("About", displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: EditUserView().environmentObject(self.user)) {
                Text("Edit")
            })
//        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView().environmentObject(UserObj())
        }       
    }
}
