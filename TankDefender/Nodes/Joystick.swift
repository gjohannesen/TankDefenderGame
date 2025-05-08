//
//  Joystick.swift
//  TankDefender
//
//  Created by Gus Johannesen on 5/7/25.
//

import SpriteKit

class Joystick: SKNode {
    private var knob: SKShapeNode!
    private var radius: CGFloat = 50
    var velocity = CGVector(dx: 0, dy: 0)

    override init() {
        super.init()
        isUserInteractionEnabled = true
        let base = SKShapeNode(circleOfRadius: radius)
        base.fillColor = .gray
        base.alpha = 0.4
        addChild(base)

        knob = SKShapeNode(circleOfRadius: 25)
        knob.fillColor = .white
        addChild(knob)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let dx = location.x
        let dy = location.y
        let distance = sqrt(dx*dx + dy*dy)
        let angle = atan2(dy, dx)

        if distance <= radius {
            knob.position = location
        } else {
            knob.position = CGPoint(x: cos(angle) * radius, y: sin(angle) * radius)
        }

        velocity = CGVector(dx: knob.position.x * 0.1, dy: knob.position.y * 0.1)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        knob.position = .zero
        velocity = .zero
    }
}

