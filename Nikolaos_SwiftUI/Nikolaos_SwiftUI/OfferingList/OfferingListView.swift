//
//  OfferingListView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/15.
//

import SwiftUI

struct OfferingListView: View {
    @State var nikolaos_number:[String] = []
    @State var nikolaos_number_count = 0
    
    var body: some View {
       Text("募集一覧")
    }
    
    func show(){ //使うときはself.show() 今は学籍番号の配列
       
        let itemModel = ItemModel()
        itemModel.read(completion: {(offerListData) in
            print(offerListData)// Array<Locker>
            // ここに表示処理を書く
            
            var nikolaos_number:Array<String> = []
            var data = offerListData
            if let data = offerListData{
            print(type(of:data))
                for d in data{
                    nikolaos_number.append(d.nikolaos_number ?? "データはありません")
                }
            }
            DispatchQueue.main.async {
                self.nikolaos_number = nikolaos_number
                self.nikolaos_number_count = nikolaos_number.count
                print(self.nikolaos_number)
                print(nikolaos_number.count)
            }
        })
    }
}

struct OfferingListView_Previews: PreviewProvider {
    static var previews: some View {
        OfferingListView()
    }
}
