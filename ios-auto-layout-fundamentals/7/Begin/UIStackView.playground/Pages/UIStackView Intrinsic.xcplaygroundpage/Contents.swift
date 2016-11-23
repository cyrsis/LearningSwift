//: ##### Intrinsic Content Size
//: [Previous](@previous)

import UIKit
import XCPlayground

let stackView = stackViewWithFourDemoViews()

stackView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
stackView.axis = .Vertical
stackView.spacing = 10
stackView.alignment = .Trailing
stackView.distribution = .EqualSpacing

XCPlaygroundPage.currentPage.liveView = stackView
