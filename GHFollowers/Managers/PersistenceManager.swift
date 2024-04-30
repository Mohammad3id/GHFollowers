//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 21/04/2024.
//

import Foundation

enum PersistenceAction {
    case add, remove
}

struct PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys { static let favorites = "favorites" }
    
    
    private init() {}
    
    
    static func updateFavorites(with favorite: Follower, actionType: PersistenceAction) throws {
        var favorites = try retrieveFavorites()
        
        switch actionType {
        case .add:
            guard !favorites.contains(favorite) else { throw GFError.alreadyInFavorites }
            favorites.append(favorite)
        case .remove:
            favorites.removeAll { $0.login == favorite.login }
        }
        
        try saveFavorites(favorites: favorites)
    }
    
    
    static func retrieveFavorites() throws -> [Follower] {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else { return [] }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([Follower].self, from: favoritesData)
    }
    
    
    static func saveFavorites(favorites: [Follower]) throws {
        let encoder = JSONEncoder()
        let encodedFavorites = try encoder.encode(favorites)
        defaults.setValue(encodedFavorites, forKey: Keys.favorites)
    }
    
}
