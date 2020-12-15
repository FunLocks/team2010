//
//  ContentView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/13.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            OfferingListView()
                .tabItem {
                    Text("募集一覧")
                }
                .tag(0)
            OfferView()
                .tabItem {
                    Text("募集する")
                }
                .tag(1)
            CameraView()
                .tabItem {
                    Text("QR読取")
                }
                .tag(2)
            ReservingListView()
                .tabItem {
                    Text("受取予定")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
