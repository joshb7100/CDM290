//
//  FavoritesList.swift
//  Fonts
//
//  Created by Robert Barrett on 3/19/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList{
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites:[String]
    
    init(){
        let defaults = UserDefaults.standard
        let storedFavorites =  defaults.object(forKey: "Favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites!:[]
    }
    func addFavorite(fontName:String){
        if !favorites.contains(fontName){
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    private func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()  
    }
}