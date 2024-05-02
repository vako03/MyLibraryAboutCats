//
//  CatFactsViewModel.swift
//  
//
//  Created by vako on 02.05.24.
//


import Foundation

public class CatFactsViewModel {
    public init() {} // Make the initializer public
    
    private let api = CatFactsAPI()
    public private(set) var facts: [CatFact] = []
    
    public func fetchFacts(completion: @escaping () -> Void) {
        api.fetchFacts { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching facts: \(error.localizedDescription)")
                completion()
                return
            }
            
            if let result = result {
                self.facts = result
                completion()
            }
        }
    }
}
