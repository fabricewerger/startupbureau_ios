//
//  ApiEndpont.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/11/2021.
//

import Foundation

protocol APIBuilder{
    var urlRequest: URLRequest { get}
    var baseUrl: String { get }
    var path: String { get }
}

enum CourseAPI {
    case getCourse
    case getSubscriptions
    case getChecklist(id: String)
}

extension CourseAPI: APIBuilder {
    
    var baseUrl: String {
        return "https://startup-desk-nonauth.azurewebsites.net/api/"
    }
    
    var urlRequest: URLRequest {
        var url = URLComponents(string: "\(self.baseUrl)\(self.path)")
        var request = URLRequest(url: (url?.url)!)
        
        switch self{
        case .getCourse:
            request.httpMethod = "GET"
        case .getSubscriptions:
            request.httpMethod = "GET"
        case .getChecklist:
            request.httpMethod = "GET"
        }
        
        
        return request
    }
    
    var path: String {
        switch self {
        case .getCourse:
            return "courses"
        case .getSubscriptions:
            return "subscriptions/users/d54a548c-1ce4-4b20-a154-2f180382af2c"
        case .getChecklist(let id):
            return "courses/subscriptions/\(id)"
        }
    }
    
    var queryParams: [URLQueryItem] {
        switch self {
        case .getCourse:
            return [URLQueryItem(name: "feed", value: String())]
        case .getSubscriptions:
            return [URLQueryItem(name: "feed", value: String())]
        case .getChecklist:
            return [URLQueryItem(name: "feed", value: String())]
            
        }
    }
}

