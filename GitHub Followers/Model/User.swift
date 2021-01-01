//
//  User.swift
//  GitHub Followers
//
//  Created by Julian Martinez on 12/31/20.
//

import Foundation

struct User: Codable {
    var login : String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var follower: Int
    var createdAt: String
}
