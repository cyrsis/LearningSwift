//: ##### UIStackView with UIViews
//: [Previous](@previous)

import UIKit
import XCPlayground

let stackView = stackViewWithFourViews()

stackView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
stackView.axis = .Horizontal
stackView.spacing = 10
stackView.alignment = .Trailing
stackView.distribution = .FillEqually

XCPlaygroundPage.currentPage.liveView = stackView

//: [Next](@next)