import SpriteKit
import AVFoundation
import Foundation


class GameScene: SKScene, SKPhysicsContactDelegate {
    var hero: Hero!
    var joystick: Joystick!
    var backgroundMusicPlayer: AVAudioPlayer?
    var cameraNode: SKCameraNode!

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = .zero
        
        cameraNode = SKCameraNode()
        self.camera = cameraNode
        addChild(cameraNode)

        setupBackground()
        setupHero()
        setupJoystick()
        spawnEnemies()
        playBackgroundMusic()
        
    }
    
    func playBackgroundMusic() {
        if let musicURL = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
                backgroundMusicPlayer?.numberOfLoops = -1  // Loop indefinitely
                backgroundMusicPlayer?.volume = 0.5
                backgroundMusicPlayer?.play()
            } catch {
                print("Could not load music file: \(error)")
            }
        } else {
            print("Music file not found.")
        }
    }



    func setupBackground() {
        let bg = SKSpriteNode(imageNamed: "Background")
        bg.position = CGPoint(x: 0, y: 0)  // Center of the world
        bg.zPosition = -1
        bg.size = CGSize(width: 10000, height: 10000)  // Large enough to scroll
        addChild(bg)
    }



    func setupHero() {
        hero = Hero()
        hero.position = CGPoint(x: size.width/2, y: size.height * 0.2)
        addChild(hero)
    }

    func setupJoystick() {
        joystick = Joystick()
        joystick.position = CGPoint(x: -size.width / 2 + 100, y: -size.height / 2 + 100)
        cameraNode.addChild(joystick)
    }


    func spawnEnemies() {
        // Add logic to spawn enemies periodically
    }

    override func update(_ currentTime: TimeInterval) {
        hero.update(joystick: joystick)
        cameraNode.position = hero.position
    }


    func didBegin(_ contact: SKPhysicsContact) {
        // Handle collisions
    }
}
