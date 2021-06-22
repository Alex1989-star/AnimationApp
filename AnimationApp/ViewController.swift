//
//  ViewController.swift
//  AnimationApp
//
//  Created by Леся on 21.06.2021.
//


import Spring
//carthage
//cocoa pods
//swift package

//sudo gem install cocoapods

//cd project_path

//pod init

//редактируем podfile

//pod install

class ViewController: UIViewController {
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var animationView: SpringView!
    
    
    @IBOutlet weak var runCoreAnimations: SpringButton!
    
    private var originCoordinate: CGFloat?
    
    private let animationSet = Animation.getAnimationSettings()
    private var randomAnimation = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // originCoordinate = animationView.frame.origin.x
        
        randomAnimation = animationSet.preset.randomElement() ?? ""
        
    }

    @IBAction func tappedRunAnimationButton(_ sender: SpringButton) {
        sender.pulsate()
        
        animationView.animation = randomAnimation
        
        animationView.curve = animationSet.curve.randomElement() ?? ""
        animationView.force = CGFloat(Double.random(in: animationSet.force))
        animationView.duration = CGFloat(Double.random(in: animationSet.duration))
        animationView.delay = CGFloat(Double.random(in: animationSet.delay))
        
        animationView.animate()
        
        randomAnimation = animationSet.preset.randomElement() ?? ""
        runCoreAnimations.setTitle("Run \(randomAnimation)", for: .normal)
        
        setLabels()
       /* UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.autoreverse, .repeat],
            animations: {
                if self.animationView.frame.origin.x == self.originCoordinate {
                    self.animationView.frame.origin.x -= 40
                } else {
                    self.animationView.frame.origin.x += 40
            }
        }
    )*/
        
    }
    
    private func setLabels() {
        presetLabel.text = animationView.animation
        curveLabel.text = animationView.curve
        forceLabel.text = String(Float(animationView.force * 100).rounded() / 100)
        durationLabel.text = String(Float(animationView.duration * 100).rounded() / 100)
        delayLabel.text = String(Float(animationView.delay + 100).rounded() / 100)
    }
}

