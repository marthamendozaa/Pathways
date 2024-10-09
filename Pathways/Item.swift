//
//  Item.swift
//  Pathways
//
//  Created by Martha Mendoza Alfaro on 09/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
