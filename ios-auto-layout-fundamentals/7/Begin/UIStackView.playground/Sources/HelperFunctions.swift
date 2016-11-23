import Foundation
import UIKit

public let niceBlue = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1.0)
public let niceYellow: UIColor = UIColor(red: 232/255, green: 199/255, blue: 55/255, alpha: 1.0)
public let niceRed: UIColor = UIColor(red: 231/255, green: 102/255, blue: 48/255, alpha: 1.0)
public let niceGreen: UIColor = UIColor(red: 119/255, green: 224/255, blue: 105/255, alpha: 1.0)

public func viewWithColor<T: UIView>(backgroundColor: UIColor) -> T {
    let view = T(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = backgroundColor
    
    return view
}

public func stackViewWithFourLabel() -> UIStackView {
    let label1: UILabel = viewWithColor(niceGreen)
    label1.text = "Label 1"
    label1.textAlignment = .Center
    
    let label2: UILabel = viewWithColor(niceRed)
    label2.text = "Label 2"
    label2.textAlignment = .Center
    
    let label3: UILabel = viewWithColor(niceYellow)
    label3.text = "Label 3"
    label3.textAlignment = .Center
    
    let label4: UILabel = viewWithColor(niceBlue)
    label4.text = "Label 4"
    label4.textAlignment = .Center
    
    let stackView = UIStackView(arrangedSubviews: [label1, label2, label3, label4])
    return stackView
}

public func stackViewWithFourViews() -> UIStackView {
    let view1 = viewWithColor(niceGreen)
    let view2 = viewWithColor(niceRed)
    let view3 = viewWithColor(niceBlue)
    let view4 = viewWithColor(niceYellow)
    
    let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4])
    return stackView
}

public func stackViewWithFourDemoViews() -> UIStackView {
    let view1: DemoView = viewWithColor(niceGreen)
    let view2: DemoView = viewWithColor(niceRed)
    let view3: DemoView = viewWithColor(niceBlue)
    let view4: DemoView = viewWithColor(niceYellow)
    
    let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4])
    return stackView
}