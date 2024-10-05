//
//  TRPFavoriteUseCasesTest.swift
//  TRPDataLayerTests
//
//  Created by Evren Yaşar on 28.07.2020.
//  Copyright © 2020 Tripian Inc. All rights reserved.
//

import Foundation
import XCTest
@testable import TRPDataLayer

class TRPFavoriteUseCasesTest: XCTestCase {
    
    class MockFavoriteRepository: FavoriteRepository {
        var results: ValueObserver<[TRPFavorite]> = .init([])
        
        var error: ValueObserver<Error> = .init(nil)
        
        init() {}
        
        func fetchFavorites(cityId: Int, completion: @escaping (FavoriteResultsValue) -> Void) {}
        
        func addFavorite(poiId: String, completion: @escaping (FavoriteResultValue) -> Void) {}
        
        func removeFavorite(favoriteId: Int, completion: @escaping (FavoriteResultStatus) -> Void) {}
        
    }
    
    func testAddFavorite() {
        let mockFavorite = MockFavoriteRepository()
        var favoriteUseCases = TRPFavoriteUseCases(favoriteRepository: mockFavorite)
        
    }
    
    
}
