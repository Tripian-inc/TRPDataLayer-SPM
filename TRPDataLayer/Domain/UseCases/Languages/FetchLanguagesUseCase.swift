//
//  FetchLanguagesUseCase.swift
//  TRPDataLayer
//
//  Created by Cem Çaygöz on 8.09.2024.
//  Copyright © 2024 Tripian Inc. All rights reserved.
//

import Foundation

public protocol FetchLanguagesUseCase {
    func executeFetchLanguages(completion: ((Result<[String : Any], Error>) -> Void)?)
    func executeGetLanguageValue(for key: String, completion: ((Result<String, Error>) -> Void)?)
    
    func getLanguageValue(for key: String) -> String
}
