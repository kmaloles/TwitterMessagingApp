//
//  TwitterManager.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterManager {
    
    static let shared = TwitterManager()
    
    
    //TODO: check user session if still logged in at startup
    var isLoggedIn: Bool {
        return TWTRTwitter.sharedInstance().sessionStore.session() != nil
    }
    
    var activeSessionUserID: String? {
        return TWTRTwitter.sharedInstance().sessionStore.session()?.userID
    }
    
    var userName: String?
    var currentUser: User?
    
    func login(_ callback: @escaping (Bool)->()){
        TWTRTwitter.sharedInstance().logIn {(session, error) in
            if let error = error {
                debugPrint("error logging in : \(error)")
                callback(false)
            }else {
                debugPrint("logged in user with id \(String(describing: session?.userID))")
                self.userName = session?.userName
                //saves current user details
                var user = User()
                user.idStr = session?.userID
                user.name = session?.userName
                self.currentUser = user
                callback(true)
            }
        }
    }
    
    func getFollowers(_ callback: @escaping ([User])->()){
        guard let session = TWTRTwitter.sharedInstance().sessionStore.session() else {
            return
        }
        
        let client = TWTRAPIClient(userID: session.userID)
        // make requests with client
        
        let statusesShowEndpoint = "https://api.twitter.com/1.1/followers/list.json?skip_status=true&include_user_entities=false"
        var clientError : NSError?
        
        let request = client.urlRequest(withMethod: "GET", urlString: statusesShowEndpoint, parameters: nil, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(String(describing: connectionError))")
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                debugPrint(jsonObject)
                let response = try decoder.decode(UserResponse.self, from: data)
                callback(response.users ?? [])
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
    
}
