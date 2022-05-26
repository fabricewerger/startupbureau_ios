//
//  CourseCellNameView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 08/12/2021.
//

import SwiftUI

struct CourseCellNameView: View {
    var body: some View {
        HStack(alignment: .center){
            Text("Title")
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 30))

        }
    }
}

struct CourseCellNameView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCellNameView()
    }
}
