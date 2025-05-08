import SpriteKit
import AVFoundation
import Foundation


class GameScene: SKScene, SKPhysicsContactDelegate {
    var hero: Hero!
    var joystick: Joystick!
    var backgroundMusicPlayer: AVAudioPlayer?

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = .zero

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
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.zPosition = -1
        bg.size = self.size
        addChild(bg)
    }


    func setupHero() {
        hero = Hero()
        hero.position = CGPoint(x: size.width/2, y: size.height * 0.2)
        addChild(hero)
    }

    func setupJoystick() {
        joystick = Joystick()
        joystick.position = CGPoint(x: 100, y: 100)
        addChild(joystick)
    }

    func spawnEnemies() {
        // Add logic to spawn enemies periodically
    }

    override func update(_ currentTime: TimeInterval) {
        hero.update(joystick: joystick)
    }

    func didBegin(_ contact: SKPhysicsContact) {
        // Handle collisions
    }
}
