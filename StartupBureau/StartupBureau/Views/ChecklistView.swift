//
//  Checklist.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/11/2021.
//

import SwiftUI

struct ChecklistView: View {
    
    let subscription: CourseSubscriptionsProperties
    
    @StateObject var viewModel = ChecklistViewModelImpl(service: ChecklistServiceImpl())
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView().onAppear(perform: {
                viewModel.getChecklist(id: subscription.id)})
                .pageView(ignoresSafeArea: true, edges: .bottom)
        case .failed(let error):
            ErrorView(error: error, handler: { viewModel.getChecklist(id: subscription.id) })
        case .success(let checkList):
            List(checkList.courseSteps) { courseStep in
                ZStack {
                    CheckView(title: courseStep.title)
                }
            }
            .listStyle(.plain)
            .navigationBarTitle("")
        }
    }
}

struct CheckView: View {
    
    let title: String
    
    @State private var checkbox2: Bool = false
    
    
    var body: some View {
        Toggle(isOn: $checkbox2){
            Text(title)
        }.toggleStyle(CheckboxToggleStyle(isReversed: true))
    }
}

struct Checklist_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
