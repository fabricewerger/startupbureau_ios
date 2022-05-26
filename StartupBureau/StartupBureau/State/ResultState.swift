//
//  ResultState.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 24/11/2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: Course)
    case failed(error: Error)
}

enum ResultStateSubscriptions {
    case loading
    case success(content: Subscriptions)
    case failed(error: Error)
}

enum ResultStateChecklist {
    case loading
    case success(content: Checklist)
    case failed(error: Error)
}


