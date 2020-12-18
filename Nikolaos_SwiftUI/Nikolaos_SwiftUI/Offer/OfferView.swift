//
//  OfferView.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/15.
//

import SwiftUI

struct OfferView: View {
    var body: some View {
        VStack{
        Text("募集")
        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
