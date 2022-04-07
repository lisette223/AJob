//
//  User.swift
//  AJob
//
//  Created by Lisette Antigua on 4/5/22.
//

import Firebase

struct User {
  let uid: String
  let email: String

  init(authData: Firebase.User) {
    uid = authData.uid
    email = authData.email ?? ""
  }

  init(uid: String, email: String) {
    self.uid = uid
    self.email = email
  }
}