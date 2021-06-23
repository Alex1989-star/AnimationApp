//
//  SpringAnimationSettings.swift
//  AnimationApp
//
//  Created by Леся on 22.06.2021.
//

import Foundation

struct Animation {
    var preset: [String]
    var curve: [String]
    var force: ClosedRange<Double>
    var duration: ClosedRange<Double>
    var delay: ClosedRange<Double>
    
    static func getAnimationSettings() -> Animation {
        let animation = Animation(
            preset: DataManager.shared.springPresets,
            curve: DataManager.shared.springCurve,
            force: DataManager.shared.force,
            duration: DataManager.shared.duration,
            delay: DataManager.shared.delay
        )
        return animation
}
}

