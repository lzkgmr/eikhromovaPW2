import UIKit

extension WishMakerViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        static let animationTime: CGFloat = 0.5
        static let colorAlpha: CGFloat = 1.0
    }
    
    // MARK: - Slider Creation
    internal func createSliders() -> [CustomSlider] {
        return [
            CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax),
            CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax),
            CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        ]
    }
    
    // MARK: - Slider Actions Setup
    internal func setupSlidersActions(_ sliders: [CustomSlider]) {
        for slider in sliders {
            stack.addArrangedSubview(slider)
            slider.valueChanged = { [weak self] _ in
                self?.updateBackgroundColor()
            }
        }
    }
    
    // MARK: - Background Color Update
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
