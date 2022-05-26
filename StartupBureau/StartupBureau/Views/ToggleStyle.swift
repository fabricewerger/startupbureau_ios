//
//  ToggleStyle.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 01/03/2022.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    var isReversed = false
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if !isReversed {
                configuration.label
            }
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            }
            .padding(5)
            .font(.title3)
            .accentColor(Color(UIColor.label))
            if isReversed {
                configuration.label
            }
        }
    }
}
