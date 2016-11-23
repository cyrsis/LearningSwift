//: ### UIStackView Playground

import UIKit
import XCPlayground

let stackView = stackViewWithFourLabel()

stackView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
stackView.axis = .Vertical
stackView.spacing = 40
stackView.alignment = .Leading
stackView.distribution = .Fill

XCPlaygroundPage.currentPage.liveView = stackView

//: [Next](@next)