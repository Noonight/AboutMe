//
//  ContentView.swift
//  AboutMe
//
//  Created by Aiur on 20.08.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import SwiftUI
import Contacts

struct ContentView: View {
    @EnvironmentObject private var contacts: ContactsObj
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        self.contacts.contacts.shuffle()
                    }) {
                        Text("Shuffle")
                    }
                    Spacer()
                }
                .padding([.leading, .top], 14)
                List {
                    ForEach(contacts.contacts) { contact in
                        HStack {
                            Text(contact.name)
                            Spacer()
                            Text(contact.phoneNumber)
                        }
                    }
                }
                .id(UUID())
                .navigationBarTitle(Text("Contacts"), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: AboutView().environmentObject(UserObj())) {
                    Image(systemName: "person.crop.circle")
                    .resizable()
                        .frame(width: 30, height: 30)
                    })
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContactsObj())
    }
}
