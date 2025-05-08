//
//  Projectile.swift
//  TankDefender
//
//  Created by Gus Johannesen on 5/7/25.
//

import SpriteKit
import Foundation


class Projectile: SKSpriteNode {
    init() {
        let texture = SKTexture(imageNamed: "Projectile")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        self.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.physicsBody?.usesPreciseCollisionDetection = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fire() {
        let move = SKAction.moveBy(x: 0, y: 1000, duration: 2)
        let remove = SKAction.removeFromParent()
        run(SKAction.sequence([move, remove]))
    }
}
