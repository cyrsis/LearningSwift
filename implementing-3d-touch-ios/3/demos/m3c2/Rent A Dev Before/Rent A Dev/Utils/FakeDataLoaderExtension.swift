//
//  FakeDataLoader.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 8/13/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func beginFakeDataLoad(_ completion:@escaping () -> ())
    {
        let fakeActivity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let loadingLabel = UILabel()
        
        fakeActivity.translatesAutoresizingMaskIntoConstraints = false
        fakeActivity.startAnimating()
        view.addSubview(fakeActivity)
        fakeActivity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fakeActivity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.text = "Finding Nearby Developers..."
        view.addSubview(loadingLabel)
        loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingLabel.topAnchor.constraint(equalTo: fakeActivity.bottomAnchor, constant: 8).isActive = true
        
        let loadingDelay = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: loadingDelay) {
            fakeActivity.stopAnimating()
            fakeActivity.removeFromSuperview()
            loadingLabel.removeFromSuperview()
            
            completion()
        }
    }
}
