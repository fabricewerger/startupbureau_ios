//
//  CourseDetail.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 06/12/2021.
//

import SwiftUI


struct CourseDetail: View {
    
    @Binding var homeNavigationFlow: Bool
    
    @State private var option1: Bool = false
    @State private var option2: Bool = false
    @State private var option3: Bool = false
    @State private var optionAll: Bool = false
    
    
    let course: CourseProperties
    
    @EnvironmentObject var menuSettings: MenuSettings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                
                Image("blue")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .overlay(Text(course.name))
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                VStack(alignment: .leading){
                    Text(course.title)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text(course.welcomeDescription)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    
                    Text("Extra opties")
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                }
                
                VStack {
                    Toggle(
                        isOn: $option1,
                        label: {
                            Text("Hosting (€10 per maand)")
                        })
                    
                    Toggle(
                        isOn: $option2,
                        label: {
                            Text("Telefoonnummer (€20 per maand)")
                        })
                    
                    Toggle(
                        isOn: $option3,
                        label: {
                            Text("Verzekering (€30 per maand)")
                        })
                }.padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                
                HStack{
                    Text("totaal bedrag")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading)
                        .padding(.trailing)
                    
                    Text("€50")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading)
                        .padding(.trailing)
                    
                    
                    
                    if option1 == true {
                        Text("+ €10")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    else if option2 == true{
                        Text("+ €20")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    else if option3 == true{
                        Text("+ €30")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    else if option1 && option2 == true{
                        Text("+ €30")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    else if option1 && option3 == true{
                        Text("+ €40")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    else if option2 && option3 == true{
                        Text("+ €50")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    else if option1 && option2 && option3 == true{
                        Text("+ €60")
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    Spacer()
                    
                }
                
                NavigationLink {
                    CourseBuyView( option1:  .constant(true), option2:  .constant(true), option3:  .constant(true), homeNavigationFlow: $homeNavigationFlow)
                } label: {
                    Text("Samengestelde pakket kopen")
                }
                
                .padding()
                .foregroundColor(.white)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
            }
            
        }
        
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(homeNavigationFlow: .constant(false), course: CourseProperties(
            id: "0",
            name: "testname",
            price: 0,
            title: "testtitle",
            welcomeDescription: "testwelcomeDescription welcomeDescription telcomeDescription testwelcomeDescription tesomeDescription testmeDescription testwelcomeDescription",
            thumbNailID: "test",
            bannerID: "bannerIDtest",
            createdDate: "testcreatedDate",
            lastEdited: "testlastEdited"))
    }
}
