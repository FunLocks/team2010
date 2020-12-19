//
//  OfferView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/15.
//

import SwiftUI
//
struct OfferView: View {
    @State var itemname: Array<String> = []
    @State var count:Array<Int> = []
    @State var nikolaos_count = 0
    @State var text = ""
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
                    Text(self.text)
                    Text("\(nikolaos_count)個のアイテムが登録されています")
                    ForEach(0..<nikolaos_count){index in
                        Text("\(self.itemname[index])")
                    }
                }.listStyle(PlainListStyle())
                
                VStack(alignment: .center) {

                    Button(action: {
                        self.show()
                    }) {
                           Text("更新")
                               .foregroundColor(Color.white)
                               .padding()
                               .background(Color.blue)
                               .cornerRadius(10)
                       }
                 }
                .navigationBarTitle("物品を追加", displayMode: .inline)
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
//                            Spacer()
//                            Button(action: {
//
//                            }) {
////                                Image(systemName: "plus")
//                                Text("編集")
//                            }

                        }
                )
            }
        }
    }


    func show(){
        let itemModel = ItemModel()
        itemModel.readToSelect(nikolaosNumber: "1017177",completion: {(lockerData) in
//            print(lockerData)// Array<Item>
            // ここに表示処理を書く
            
            var itemname:Array<String> = []
            var count:Array<Int> = []
            var data = lockerData
            print("viewまできた")
            print(data)
            for d in data{
                itemname.append(d.itemname)
                count.append(d.count)
            }
            DispatchQueue.main.async {
                self.itemname = itemname
                self.count = count
                self.nikolaos_count = itemname.count
                self.text = "更新しました"
                print("self.itemname",self.itemname)
                print("self.count",self.count)

            }
        })
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
                                        var model = ItemModel()
                                        model.create(items: $itemList.itemList.wrappedValue,nikolaosNumber: "1017177")

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
