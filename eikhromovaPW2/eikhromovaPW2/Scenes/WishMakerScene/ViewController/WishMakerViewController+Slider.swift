//
//  WishMakerViewController+Slider.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

extension WishMakerViewController {
    
    internal func createSliders() -> [CustomSlider] {
        return [
            CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax),
            CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax),
            CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        ]
    }
    
    internal func setupSlidersActions(_ sliders: [CustomSlider]) {
        for slider in sliders {
            stack.addArrangedSubview(slider)
            slider.valueChanged = { [weak self] _ in
                self?.updateBackgroundColor()
            }
        }
    }
    
    internal func updateBackgroundColor() {
        let redValue = CGFloat(sliders[0].slider.value)
        let greenValue = CGFloat(sliders[1].slider.value)
        let blueValue = CGFloat(sliders[2].slider.value)
        
        let newColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: Constants.colorAlpha)
        
        UIView.animate(withDuration: Constants.animationTime) {
            self.view.backgroundColor = newColor
        }
    }
}
