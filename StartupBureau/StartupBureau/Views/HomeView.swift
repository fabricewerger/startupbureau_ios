//
//  HomeView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 03/12/2021.
//

import SwiftUI
import URLImage

struct Home: View {
    
    @State var currentSelection: Int = 0
    
    @StateObject var viewModel = CourseViewModelImpl(service: CourseServiceImpl())
    @StateObject var viewModelSub = SubscriptionsViewModelImpl(service: SubscriptionsServiceImpl())
    
    @EnvironmentObject var menuSettings: MenuSettings
    @State var homeNavigationFlow: Bool = false
    @State var homeNavigationChatFlow: Bool = false
    
    
    var body: some View {
        
        VStack{
            
            VStack(spacing: 0){
                
                HStack{
                    
                    Button {
                        withAnimation{menuSettings.show.toggle()}
                    } label: {
                        Image("me14")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                Divider()
            }
            .overlay(
                Text("Home")
            )
            .coordinateSpace(name: "Top")
            
            NavigationView{
                
                PagerTabView(tint: .black,selection: $currentSelection){
                    
                    Text("Mijn collectie")
                        .pageLabel()
                        .offset(y:-10)
                    
                    Text("Alles zien")
                        .pageLabel()
                        .offset(y:-10)
                    
                } content: {
                    
                    switch viewModelSub.state {
                    case .loading:
                        ProgressView().onAppear(perform: {
                            viewModelSub.getSubscriptions()})
                            .pageView(ignoresSafeArea: true, edges: .bottom)
                    case .failed(let error):
                        ErrorView(error: error, handler: { viewModelSub.getSubscriptions() })
                    case .success(let subscriptions):
                        List(subscriptions) { subscription in
                            ZStack {
                                SubscriptionCell(subscription: subscription)
                                NavigationLink {
                                    ChecklistView(subscription: subscription)
                                } label: {
                                    EmptyView()
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }
                    
                    switch viewModel.state {
                    case .loading:
                        ProgressView().onAppear(perform: {
                            viewModel.getCourses()})
                            .pageView(ignoresSafeArea: true, edges: .bottom)
                    case .failed(let error):
                        ErrorView(error: error, handler: { viewModel.getCourses() })
                    case .success(let courses):
                        List(courses) { item in
                            ZStack {
                                CourseCell(course: item)
                                NavigationLink(isActive: $homeNavigationFlow) {
                                    CourseDetail(homeNavigationFlow: $homeNavigationFlow, course: item)
                                } label: {
                                    EmptyView()
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }
                }
                .padding(.top)
                .ignoresSafeArea(.container, edges: .bottom)
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
