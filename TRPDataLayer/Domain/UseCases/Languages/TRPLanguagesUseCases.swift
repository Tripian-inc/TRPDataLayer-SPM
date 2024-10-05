//
//  TRPLanguagesUseCases.swift
//  TRPDataLayer
//
//  Created by Cem Çaygöz on 8.09.2024.
//  Copyright © 2024 Tripian Inc. All rights reserved.
//

import Foundation

public final class TRPLanguagesUseCases {
    private(set) var repository: LanguagesRepository
    
    private var retryCount = 0
    public init(repository: LanguagesRepository = TRPLanguagesRepository()) {
        self.repository = repository
    }
}

extension TRPLanguagesUseCases : FetchLanguagesUseCase {
    public func getLanguageValue(for key: String) -> String {
        if repository.results.isEmpty {
            return ""
        } 
        return getLanguageValueWithKey(key)
    }
    
    public func executeGetLanguageValue(for key: String, completion: ((Result<String, any Error>) -> Void)?) {
        let onComplete = completion ?? {  result in }
        if repository.results.isEmpty {
            executeFetchLanguages() { [weak self] result in
                switch(result) {
                case .success(_):
                    completion?(.success(self?.getLanguageValueWithKey(key) ?? ""))
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        } else {
            
        }
    }
    
    private func getLanguageValueWithKey(_ key: String) -> String {
        if let keyValue = repository.results["keys"] as? [String: String] {
            return keyValue[key] ?? key
        }
        return key
    }
    
    
    public func executeFetchLanguages(completion: ((Result<[String : Any], Error>) -> Void)?) {
        let onComplete = completion ?? { result in }
        repository.fetchLanguages {  result in
            switch(result) {
            case .success(let result):
                onComplete(.success(result))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}
