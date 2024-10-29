# WishMaker
There are the answers to the homework questions.
## What issues prevent us from using storyboards in real projects?
1. Large storyboards can slow down Xcode and lead to perfomance issues, making it harder to edit and navigate through the progect.
2. Complex UI requirements often demand custom views and animations that can be difficult to achieve within the storyboard's constraints.
3. Lack of reusability
4. Storyboards are specific to Xcode, so any version-specific bugs in Xcode can impact storyboard usability.
5. When multiple developers work on the same storyboard, merge conflicts can occur frequently, and resolving them can be challenging.
## What does the code on lines 25 and 29 do?
```swift
private func configureUI() {
    view.backgroundColor = .systemPink
    configureTitle()
}
    
private func configureTitle() {
    let title = UILabel()
    // This prevents UIKit from automatically creating constraints based on the frame, allowing us to define custom constraints, which is necessary when using Auto Layout constraints programmatically in UIKit. 
    title.translatesAutoresizingMaskIntoConstraints = false
    title.text = "WishMaker"
    title.font = UIFont.systemFont(ofSize: 32)

    // This line adds the title label to the `view`'s hierarchy, making it visible on the screen. Without this, the label would exist in memory but not be displayed.
    view.addSubview(title)
    NSLayoutConstraint.activate([
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constrant: 20),
        title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
    ])
}
```
## What is a safe area layout guide?
The safe area layout guide is a feature in UIKit that defines the portion of a view that is guaranteed to be unobstructed by system elements, like the status bar, navigation bar, toolbar, and the home indicator on devices with notches or rounded corners. The code aligns the top anchor of the title label to the top of the view's safe area layout guide, with a 30-point offset. This ensures that the label appears below any system bars or obstructions, keeping it fully visible and respecting the device's safe areas.
## What is [weak self] on line 23 and why it is important?
```swift
private func configureSliders() {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    view.addSubview(stack)
    stack.layer.cornerRadius = 20
    stack.clipsToBounds = true
    
    let sliderRed = CustomSlider(title: Constants.red, min: 0, max: 1)
    let sliderBlue = CustomSlider(title: Constants.blue, min: 0, max: 255)
    let sliderGreen = CustomSlider(title: Constants.green, min: 0, max: 255)
    
    for slider in [sliderRed, sliderBlue, sliderGreen] {
        stack.addArrangedSubview(slider)
    }
    
    NSLayoutConstraint.activate([
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40)
    ])
    
    sliderRed.valueChanged = { [weak self] in
        self?.view.backgroundColor = ...
   }
}
```
The [weak self] syntax is a capture list used in closures to prevent strong reference cycles. When you reference self within a closure, the closure "captures" `self strongly, creating a reference. If self also holds a reference to the closure, this mutual referencing can create a cycle that keeps both self and the closure in memory indefinitely, resulting in a memory leak.
By marking self as weak, we avoid this strong reference. When self is no longer in use and has no other strong references, it can be deallocated, breaking the cycle and freeing up memory. 
## What does clipsToBounds mean?
The clipsToBounds property determines whether the subviews of a view are confined to the view's bounds. Setting clipsToBounds = true ensures that any part of the view's subviews that extends beyond the view's frame is not visible (it "clips" them to stay within the boundaries).
## What is the valueChanged type? What is Void and what is Double?
valueChanged is a closure property in the CustomSlider class that takes a Double parameter and returns Void, meaning it performs some action but does not return a value.
Double: Represents the new slider value that is passed to the closure when it changes.
Void: Indicates the closure doesn’t return a value—it simply performs an action (updating the view's background color based on the slider's new value).
