//
//  ItemModel.swift
//  Nikolaos_SwiftUI
//
//  Created by 新田野乃華 on 2020/12/14.
//

import Foundation
import Firebase

//struct itemDataType: Identifiable {
//    var id: String
//    var name: String
//    var message: String
//}
//
class ItemModel: ObservableObject {
//    func getItem(){
//
//    }

    var db: Firestore!

    func firebase_test(){
        db = Firestore.firestore()
        db.collection("users").getDocuments() {
            (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: (err)")
            } else {
                for document in querySnapshot!.documents {
                    print("(document.documentID) => (document.data())")
                }
            }
        }
    }
    
}
