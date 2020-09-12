//
//  ChangeUserView.swift
//  AboutMe
//
//  Created by Aiur on 23.08.2020.
//  Copyright © 2020 Aiur. All rights reserved.
//

import SwiftUI

struct EditUserView: View {
    @EnvironmentObject var user: UserObj
    @State var isShowedAddModal: Bool = false
    
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
        .overlay(
            Button(action: {
                self.isShowedAddModal.toggle()
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(FloatingButtonStyle())
            .padding(),
            alignment: .bottomTrailing)
            .sheet(isPresented: $isShowedAddModal) {
                AddUserInfo(userInfo: self.user, isShowedModal: self.$isShowedAddModal)
            }
    }
}

struct ChangeUserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditUserView(isShowedAddModal: false).environmentObject(UserObj())
        }
    }
}

struct FloatingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(20)
        .contentShape(Circle())
        .background(
            Group {
                if configuration.isPressed {
                    Circle()
                    .fill(Color.offWhite)
                    .overlay(
                        Circle()
                        .stroke(Color.gray, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .bottom))
                        )
                    )
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                            )
                    )
                } else {
                    Circle()
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                }
            }
        )
    }
}
