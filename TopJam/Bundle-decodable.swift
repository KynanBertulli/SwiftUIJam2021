//
//  Bunder-decodable.swift
//  Day-39
//
//  Created by Kynan Bertulli on 2021-09-24.
//

import Foundation


extension Bundle{
    func decode<T: Codable>(_ file: String) -> T{
        
        guard let url = self.url(forResource: file, withExtension: nil) else{
            
            fatalError("failed to locate file in bundle")
        }
        guard let data = try? Data(contentsOf: url)else{
            fatalError("failed to load file from bundle")
        }
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = dateDecodingStrategy
//        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
        print("we got here")
        return isLoaded as! T
  
        
    }
}

