//
//  R_Stats.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 11/09/25.
//

import Foundation

class R_Stats {
    static let shared = R_Stats()
    private init() {}
    private let baseURL = "http://127.0.0.1:8000/api/v1"
    private let ctx = "summary_apps_private"
    private let lastHitKey = "last-hit-summary_apps_private"
    private let fetchRestTime: TimeInterval = 180 
    
    func getSummary(completion: @escaping (SummaryResponse?) -> Void) {
        let defaults = UserDefaults.standard
        let now = Date().timeIntervalSince1970
        
        if let lastHit = defaults.double(forKey: lastHitKey) as Double?,
           now - lastHit < fetchRestTime,
           let cachedData = defaults.data(forKey: ctx),
           let summary = try? JSONDecoder().decode(SummaryResponse.self, from: cachedData) {
            
            completion(summary)
            return
        }
        
        guard let url = URL(string: "\(baseURL)/stats/summary") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(UserSession.shared.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                struct ApiResponse: Codable {
                    let data: SummaryResponse
                }
                
                let decoded = try JSONDecoder().decode(ApiResponse.self, from: data)
                let summary = decoded.data
                
                // Save cache
                if let encoded = try? JSONEncoder().encode(summary) {
                    defaults.set(encoded, forKey: self.ctx)
                    defaults.set(now, forKey: self.lastHitKey)
                }
                
                completion(summary)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
