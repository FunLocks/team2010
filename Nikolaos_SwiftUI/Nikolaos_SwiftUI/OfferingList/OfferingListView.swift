//
//  OfferingListView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/15.
//

import SwiftUI




struct OfferingListView: View {
    
    var body: some View {
//        Text(show())
        
        Text("募集一覧")
    }
}

struct OfferingListView_Previews: PreviewProvider {
    static var previews: some View {
        OfferingListView()
    }
}

func show(){// struct OfferingListView: View {の中に書くとエラー出たのでとりあえず関数で書きます
   
    let itemModel = ItemModel()
    itemModel.read(completion: {(offerListData) in
        print(offerListData)// Array<Locker>
//         ここに表示処理を書く(非同期処理してます)
        
    })
}
