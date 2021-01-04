//
//  Helper.swift
//  RememberNames
//
//  Created by Eric Chen on 1/3/21.
//

import Foundation
import SwiftUI

class helper {
    
    static func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    static  func loadImage(pathName: String) -> Data? {
            let fileName = getDocumentsDirectory().appendingPathComponent(pathName)
            do {
                let data = try Data(contentsOf: fileName)
                return data
            } catch {
                print("Unable to load image")
            }
            return nil
        }
}
