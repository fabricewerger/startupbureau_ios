//
//  Color+Extention.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 24/12/2021.
//

import Foundation
import SwiftUI

extension Color {
    init(asset: ColorAsset) {
        self.init(asset.rawValue)
    }
}

enum ColorAsset: String {
    case accentColor2 = "AccentColor2"
    case background = "AccentColor"
}
