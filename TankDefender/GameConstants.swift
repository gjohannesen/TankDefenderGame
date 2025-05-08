//
//  GameConstants.swift
//  TankDefender
//
//  Created by Gus Johannesen on 5/7/25.
//

// GameConstants.swift

import Foundation

struct PhysicsCategory {
    static let none: UInt32 = 0
    static let hero: UInt32 = 0x1 << 0
    static let enemy: UInt32 = 0x1 << 1
    static let projectile: UInt32 = 0x1 << 2
    static let collectible: UInt32 = 0x1 << 3
}
