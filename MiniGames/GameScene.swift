//
//  GameScene.swift
//  MiniGames
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
    
    var nextLevelButton:SKLabelNode!
    
    // sprites
 
    var lemmingArray:[SKNode] = []
  
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        
        // Required for SKPhysicsContactDelegate
        self.physicsWorld.contactDelegate = self
        
        // make array of lemming
        let l1 = self.childNode(withName: "lemming1")
        let l2 = self.childNode(withName: "lemming2")
        let l3 = self.childNode(withName: "lemming3")
        let l4 = self.childNode(withName: "lemming4")
        self.lemmingArray.append(e1!)
        self.lemmingArray.append(e2!)
        self.lemmingArray.append(e3!)
        self.lemmingArray.append(e4!)
    
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        
        
        // MARK: Switch Levels
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
    }
}
