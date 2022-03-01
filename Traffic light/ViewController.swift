//
//  ViewController.swift
//  Traffic light
//
//  Created by Тимур on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let minAlpha: CGFloat = 0.3
    let maxAlpha: CGFloat = 1

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var switchLightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configView(light: redLightView, color: .red)
        configView(light: yellowLightView, color: .yellow)
        configView(light: greenLightView, color: .green)
        
        configButton(switchLightButton)
    }
    
    private func configView(light: UIView, color: UIColor) {
        light.alpha = minAlpha
        light.layer.cornerRadius = light.bounds.width / 2
        light.backgroundColor = color
    }
    
    private func configButton(_ button: UIButton) {
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("START", for: .normal)
    }
    @IBAction func switchButtonPressed(_ sender: UIButton) {
        sender.setTitle("NEXT", for: .normal)
        
        if redLightView.alpha < maxAlpha && yellowLightView.alpha < maxAlpha {
            redLightView.alpha = maxAlpha
            yellowLightView.alpha = minAlpha
            greenLightView.alpha = minAlpha
        } else if yellowLightView.alpha < maxAlpha && redLightView.alpha == maxAlpha {
            yellowLightView.alpha = maxAlpha
            redLightView.alpha = minAlpha
            greenLightView.alpha = minAlpha
        } else if greenLightView.alpha < maxAlpha {
            greenLightView.alpha = maxAlpha
            yellowLightView.alpha = minAlpha
            redLightView.alpha = minAlpha
        }
    }
    
}

