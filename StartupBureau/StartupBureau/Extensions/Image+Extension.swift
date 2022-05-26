//
//  Image+Extention.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 26/01/2022.
//

import SwiftUI

extension Image {
    
    init(asset: ImageAsset) {
        self.init(asset.rawValue)
    }
}

enum ImageAsset: String {
    case profile = "me14"
}
