//
//  OfferingRowView.swift
//  Nikolaos_SwiftUI
//
//  Created by enPiT2016MBP-09 on 2020/12/15.
//

import SwiftUI

struct OfferingRowView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0.0) {
                Text("30cm定規 ×1")
                    .multilineTextAlignment(.leading)
                Text("カッター ×1")
                    .multilineTextAlignment(.leading)
                Text("ガムテープ ×1")
            }
            Spacer()
            VStack() {
                Spacer()
                Text("体育館横　1017XXX")
                    .font(.footnote)
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding()
    }
}

struct OfferingRowView_Previews: PreviewProvider {
    static var previews: some View {
        OfferingRowView()
    }
}
