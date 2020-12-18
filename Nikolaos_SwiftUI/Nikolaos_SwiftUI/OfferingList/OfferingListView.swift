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
        List {
            ForEach (0..<10) { index in
                OfferingRowView()
            }
        }
    }
}

struct OfferingListView_Previews: PreviewProvider {
    static var previews: some View {
        OfferingListView()
    }
}
