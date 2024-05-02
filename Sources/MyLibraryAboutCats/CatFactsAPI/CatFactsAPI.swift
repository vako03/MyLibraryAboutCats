//
//  File.swift
//  
//
//  Created by vako on 02.05.24.
//
import Foundation

struct CatFactsResponse: Codable {
    let data: [CatFact]
}

public class CatFactsAPI {
    public static let shared = CatFactsAPI()
    private let baseURL = URL(string: "https://catfact.ninja/")!
    
    public func fetchFacts(completion: @escaping ([CatFact]?, Error?) -> Void) {
        let factsURL = baseURL.appendingPathComponent("facts")
        
        URLSession.shared.dataTask(with: factsURL) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "Data not found", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let factsResponse = try decoder.decode(CatFactsResponse.self, from: data)
                completion(factsResponse.data, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
