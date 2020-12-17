//
//  OfferingRowView.swift
//  Nikolaos_SwiftUI
//
//  Created by enPiT2016MBP-09 on 2020/12/15.
//

import SwiftUI

struct OfferingRowView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("30cm定規 ×1")
                .multilineTextAlignment(.leading)
            Text("カッター ×1")
                .multilineTextAlignment(.leading)
            Text("ガムテープ ×1")
            Text("体育館横　1017XXX")
                .font(.footnote)
                .padding(.leading, 220.0)
                .frame(width: 400.0)
                .multilineTextAlignment(.trailing)
        }
        .padding()
        .frame(width: 400.0, height: 100.0, alignment: .topLeading)
    }
}

struct OfferingRowView_Previews: PreviewProvider {
    static var previews: some View {
        OfferingRowView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
