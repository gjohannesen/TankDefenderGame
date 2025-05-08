//
//  Hero.swift
//  TankDefender
//
//  Created by Gus Johannesen on 5/7/25.
//

import SpriteKit

class Hero: SKSpriteNode {
    init() {
        let texture = SKTexture(imageNamed: "Hero")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "hero"
        self.setScale(0.5)
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = PhysicsCategory.hero
        self.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        physicsBody?.contactTestBitMask = PhysicsCategory.fruit
        physicsBody?.collisionBitMask = 0
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.physicsBody?.affectedByGravity = false

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(joystick: Joystick) {
        let velocity = joystick.velocity
        position = CGPoint(x: position.x + velocity.dx, y: position.y + velocity.dy)
    }

    func shoot() {
        let projectile = Projectile()
        projectile.position = self.position
        self.parent?.addChild(projectile)
        projectile.fire()
    }
}
