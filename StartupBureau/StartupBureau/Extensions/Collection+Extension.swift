//
//  Collection+Extention.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 26/01/2022.
//

import Foundation

extension Collection {

    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
