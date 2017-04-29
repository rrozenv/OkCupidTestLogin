//
//  ParticleEmitter.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/29/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

class ParticleEmitterLayer: CAEmitterLayer {
    
    private let colors = [UIColor]()
    private let emitPosition: CGPoint = CGPoint(x: 0, y: 0)
    private let size: CGSize = CGSize(width: 3, height: 3)

    init(colors: [UIColor], position: CGPoint, size: CGSize, image: CGImage) {
        super.init()
        self.emitterPosition = position
        self.emitterSize = size
        self.emitterShape = kCAEmitterLayerPoints
        createEmitterCells(colors: colors, image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createEmitterCells(colors: [UIColor], image: CGImage) {
        var cells = [CAEmitterCell]()
        colors.forEach { cells.append(makeEmitterCell(color: $0, image: image)) }
        self.emitterCells = cells
    }
    
    private func makeEmitterCell(color: UIColor, image: CGImage) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 4
        cell.lifetime = 4.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 80
        cell.velocityRange = 10
        cell.emissionLongitude = CGFloat.pi * -(1/2)
        cell.emissionLatitude = 0
        cell.emissionRange = 0.45
        cell.spin = 0
        cell.spinRange = 5
        cell.scaleRange = 0
        cell.scaleSpeed = -0.05
        cell.contents = image
        return cell
    }

}
