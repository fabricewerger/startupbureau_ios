//
//  CourseCell.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 08/12/2021.
//

import SwiftUI
import URLImage

struct CourseCell: View {
    let course: CourseProperties
    
    var body: some View {
        ZStack{
            Image("blue")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
            
            Text(course.title)
                .foregroundColor(.white)
            
        }.clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        CourseCell(course: CourseProperties(
            id: "0",
            name: "testname",
            price: 0,
            title: "testtitle",
            welcomeDescription: "testwelcomeDescription welcomeDescription telcomeDescription testwelcomeDescription tesomeDescription testmeDescription testwelcomeDescription",
            thumbNailID: "test",
            bannerID: "bannerIDtest",
            createdDate: "testcreatedDate",
            lastEdited: "testlastEdited"))
            .previewLayout(.sizeThatFits)
    }
}
