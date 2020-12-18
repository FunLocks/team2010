//
//  CameraModel.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/17.
//

import Foundation

class CameraModel: ObservableObject {
    let scanInterval: Double = 1.0
    
    @Published var torchIsOn: Bool = false
    @Published var lastQrCode: String = "QR Code goes here"
    
    func onFoundQrCode(_ code: String) {
        self.lastQrCode = code
    }
}
