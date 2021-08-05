//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ali Hassan on 8/5/21.
//

import Foundation

extension Bundle{
    func decode(_ file: String) -> [CoverImage] {
        // locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // create a property for the data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        // create a decoder
        let decoder = JSONDecoder()
        
        // create property for decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // return data
        return loaded;
    }
}