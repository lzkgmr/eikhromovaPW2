import UIKit

final class CustomSlider: UIView {
    
    // MARK: - Properties
    var valueChanged: ((Double) -> Void)?
    var slider = UISlider()
    var titleView = UILabel()
    
    // MARK: - Initializers
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.titleViewTop),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titlViewLeading),
            
            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.sliderBottom),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sliderLeading)
        ])
    }
    
    // MARK: - Actions
    @objc
    private func sliderValueChanged()  {
        valueChanged?(Double(slider.value))
    }
}
