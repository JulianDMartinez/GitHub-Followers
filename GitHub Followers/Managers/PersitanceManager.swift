//
//  PersitanceManager.swift
//  GitHub Followers
//
//  Created by Julian Martinez on 1/9/21.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistanceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping (GFError?) -> Void) {
        retreiveFavorites { (result) in
            switch result {
            case .success(let favorites):
                var retreivedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retreivedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retreivedFavorites.append(favorite)
                    
                case .remove:
                    retreivedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: retreivedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retreiveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
