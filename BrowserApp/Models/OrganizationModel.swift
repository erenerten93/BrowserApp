//
//  Organization.swift
//  BrowserApp
//
//  Created by Eren Erten on 18.07.2023.
//

import Foundation


public struct OrganizationModel:Decodable{
    var loginName:String
    var id:Int
    var repoURL:String
    var avatarURL:URL
    var description:String?
    var isFavorite = false
    
    enum CodingKeys: String, CodingKey {
            case loginName = "login"
            case id
            case repoURL = "repos_url"
            case avatarURL = "avatar_url"
            case description
    }
}
