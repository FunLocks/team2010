//
//  ReservingListView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/15.
//

import SwiftUI

struct ReservingListView: View {
    @State var nikolaos_number:[String] = []
    var body: some View {
        Text("受け取り予定")
        
//        VStack{
//            Button(action:{
//                self.show()
//            }){
//                Text("受け取り予定")
//            }
//            if nikolaos_number.count>0{
//                List {
//                    ForEach(0 ..< nikolaos_number.count) { index in
//                        Text(self.nikolaos_number[index])
//                    }
//                }
//            }
//        }
        List {
            ForEach (0..<10) { index in
                OfferingRowView()
            }
        }
    }
    /* func show(){
       
        let itemModel = ItemModel()
        itemModel.receiveList(mynumber:"1017019", completion: {(offerListData) in
            print(offerListData)// Array<Locker>
            // ここに表示処理を書く
            var nikolaos_number:Array<String> = []
            var data = offerListData
//            if let data = offerListData{
            print(type(of:data))
                for d in data{
                    nikolaos_number.append(d.nikolaos_number ?? "データはありません")
                }
//            }
            DispatchQueue.main.async {
                self.nikolaos_number = nikolaos_number
            }
        })
    } */
}

struct ReservingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservingListView()
    }
}
