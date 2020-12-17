//
//  ItemModel.swift
//  Nikolaos_SwiftUI
//
//  Created by 新田野乃華 on 2020/12/14.
//
import Foundation
import Firebase

struct Locker{
    var items:Array<Item>
    var nikolaos_number: String
    init?(items:Array<Item>, nikolaos_number: String){
        self.items = items
        self.nikolaos_number = nikolaos_number
    }
}

struct Item {
    var itemname:String
    var count:Int
    var mynumber:Array<String>?
    
    init?(itemname:String, count:Int, mynumber:Array<String>?){
        self.itemname = itemname
        self.count = count
        self.mynumber = mynumber
    }
}

class ItemModel: ObservableObject {

    var db: Firestore!
    
    init() {
        self.db = Firestore.firestore()
    }
//   募集新規登録
    func create(items:Array<Item>){
        var nikolaosNumber:String = "1017125" // ログイン時に取得できるので，その変数を使いたい
        for i in items{
            db.collection("locker").document(nikolaosNumber).collection("item").document(i.itemname).setData([
                "itemname":i.itemname,//"テスト解答2",
                "count":i.count,//1,
                "mynumber":i.mynumber
            ])
            print(i.itemname,i.count,i.mynumber,"を追加")
        }
    }
    
    
//    create 使い方
//    func setTest() -> String{
//        var testItem = Item(itemname:"テスト解答", count:3, mynumber:["1017000"])
//        var testItem2 = Item(itemname:"100cm定規", count:1, mynumber:[])
//        var testItemList:Array<Item> = []
//        testItemList.append(testItem!)
//        testItemList.append(testItem2!)
//        create(items:testItemList)
//        return "set test"
//    }
//
    
    
//    募集一覧
    func read() -> String{
        var r: String = "firebase test"
        db = Firestore.firestore()
        var offerList:Array<Locker> = []
        var nikolaosNumberList: Array<String> = []
        
        db.collection("locker").getDocuments() {
            (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: (err)")
            } else {
                for document in querySnapshot!.documents {
                    var nikolaos_number:String = document.documentID
                    nikolaosNumberList.append(nikolaos_number)
                }
                print(nikolaosNumberList)
                
                for  (nikolaous,nikolaos_number) in nikolaosNumberList.enumerated(){
                    
                    self.db.collection("locker").document(nikolaos_number).collection("item").getDocuments(){
                        (querySnapshot, err) in
                        if let err = err {
                            print("エラー\n")
                            print("Error getting documents: (err)")
                        } else {
                            for (index,item) in querySnapshot!.documents.enumerated() {
                                var itemList:Array<Item> = []
                                var data = item.data()
//                                print(data)
                                guard let items = data as? [String: Any]
                                else{
                                    print("itemのOptional外し失敗")
                                    return}
                                
                                guard let itemName = items["itemname"]as? String else {
                                    print("itemnameのOptional外し失敗")
                                    return }
                                guard let mynumber = items["mynumber"]as? Array<String>?else {
                                    print("mynumberのOptional外し失敗")
                                    return }
                                guard let count = items["count"]as? Int else {
                                    print("countのOptional外し失敗")
                                        return }
                                if let item = Item(itemname:itemName, count: count, mynumber:mynumber){
                                    itemList.append(item)
                                }
//                                }
                                if let itemsList = Locker(items:itemList,nikolaos_number:nikolaos_number){
                                    offerList.append(itemsList)
                                    
                                }
                                if index == nikolaosNumberList.count-1{
                                    print("全データ受け取り")
                                    print(offerList)
                                    //　ここに受け取り後の処理を記述
                                    
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        return "firebase test"
    }
}
