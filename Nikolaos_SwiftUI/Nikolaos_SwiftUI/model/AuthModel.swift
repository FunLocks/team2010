//
//  AuthModel.swift
//  Nikolaos_SwiftUI
//
//  Created by 新田野乃華 on 2020/12/16.
//

import Foundation
import Firebase

struct Users{
    var userData:UserData
    var nikolaos_number: String
    init?(userData:UserData, nikolaos_number: String){
        self.userData = userData
        self.nikolaos_number = nikolaos_number
    }
}
struct UserData{
    var location:String
    var password: String //ログインパスワード
    var pincord: String //ロッカーの暗証番号
    init?(location:String,password: String,pincord: String){
        self.location = location
        self.password = password
        self.pincord = pincord
    }
}

class AuthModel: ObservableObject {
    var db: Firestore!
    
    init() {
        self.db = Firestore.firestore()
    }
    
    // 暗証番号取得
    func readPinCord(nikolaos_number: String){
        var ref = db.collection("users").document(nikolaos_number)
        ref.getDocument{(document, error) in
            if let document = document, document.exists {
                let pincordData = document.get("pincord")
                guard let pincord = pincordData as? String
                else{
                    print("pincordのOptional外し失敗")
                    return
                }
                print(pincord)
                //ここに処理を記述してください 暗証番号pincord: String
                
            }
        }
    }
    
    func readPinCordTest()->String{
        readPinCord(nikolaos_number: "1017177")
        return "readPinCordTest"
    }
    
}

