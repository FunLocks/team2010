//
//  OfferView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/15.
//

import SwiftUI
//
struct OfferView: View {
    @State var itemname: String = "aaa"
    @State var count:String = ""
    @State var ilist:Array<Item> = []
    @State private var selection = 20
    @State var isPresentedSubView:Bool = false

    @ObservedObject var itemList=ViewModel()

    func show(ilist:Array<Item>){
        self.ilist = ilist
    }
    
    var body: some View {
        
        NavigationView {
            VStack{
                
               
                List {
                    Text("テスト")
                    ForEach(0..<itemList.itemList.count){index in
                        Text(itemList.itemList[index].itemname)
//                        Text("test")

                    }
                }
                

                VStack(alignment: .center) {
                    Button(action: {
                        if $itemList.itemList.wrappedValue.count != 0{
                            print($itemList.itemList.wrappedValue[0].itemname)
                        }else{
                            print("データはなし")
                        }
                    }) {
                           Text("募集を登録する")
                               .foregroundColor(Color.white)
                               .padding()
                               .background(Color.blue)
                               .cornerRadius(10)
                       }
                 }
                .navigationBarTitle("募集を追加", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {

                    }) {},trailing:
                        HStack(spacing: 5) {
                            Button(action: {
                                self.isPresentedSubView.toggle()
                            }){
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: self.$isPresentedSubView
                                   ,onDismiss: {
                                        print("画面を閉じた")
                                        print($itemList.itemList.wrappedValue)
                                        self.ilist = $itemList.itemList.wrappedValue
                                        print(ilist)
                                   
                                        
                                   }
                            ) {
                                SubView(isPresent: self.$isPresentedSubView, itemList: self.itemList)
                            }
                            Spacer()
                            Button(action: {

                            }) {
//                                Image(systemName: "plus")
                                Text("編集")
                            }

                        }
                )
            }

        }


    }

}

struct SubView: View {
    @Binding var isPresent: Bool
    @State var itemname: String = ""
    @State var count:String = ""
    @State private var selection = 20
    @State var isPresentedSubView = false
    @ObservedObject var itemList:ViewModel
//    @State var item = Item(itemname: "", count: 0, mynumber: [])
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form{
            VStack{
                List {
                    HStack{
                        Text("物品名")
                        Spacer()
                        TextField("物品名を記入", text: $itemname)
                            .multilineTextAlignment(.trailing)

                    }
                    HStack{
                        Text("個数")
                        TextField("数字のみ記入", text: $count)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }


                .navigationBarTitle("物品を追加", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
//                        self.isPresent = false
//                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Button(action: {
                            self.isPresent = false
//                            self.presentationMode.wrappedValue.dismiss()

                        }){
                            Text("キャンセル")
                        }

                    },trailing:
                            Button(action: {
                                if let c = Int(self.count){
                                    if var a:Item = Item(itemname: itemname, count:c , mynumber: []) {
                                        self.itemList.update(item: a)
//                                        $itemList.itemList.wrappedValue.append(a)
//                                        print($itemList.itemList.wrappedValue)
                                        self.isPresent = false
                                    }
                                    else {
                                    }


                                }else{
                                    print("変換できません")
                                }

                            }) {
//                                Image(systemName: "plus")
                                Text("追加")
                            }
                )
            }
            }
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}

final class ViewModel: ObservableObject {
    @Published var itemList:Array<Item> = []
    
    func update(item:Item) {
        itemList.append(item)
    }
}
