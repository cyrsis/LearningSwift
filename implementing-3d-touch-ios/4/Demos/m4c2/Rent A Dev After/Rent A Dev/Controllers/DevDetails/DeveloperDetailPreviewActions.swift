//
//  DeveloperDetailPreviewActions.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 10/21/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import Foundation
import UIKit

extension DeveloperDetailViewController
{
    //MARK: Previewaction Override
    override var previewActionItems : [UIPreviewActionItem]
    {
        return [toggleFavoriteStatusActionItem()]
    }
    
    fileprivate func toggleFavoriteStatusActionItem() -> UIPreviewAction
    {
        let title = developer.isFavorite ? "Remove from Favorites" : "Add to Favorites"
        let style : UIPreviewActionStyle = developer.isFavorite ? .destructive : .default
        return UIPreviewAction(title: title, style: style, handler:  { previewAction, viewController in
            self.developer.isFavorite = !self.developer.isFavorite
            DevDataManager.saveDeveloper(self.developer)
        })
    }
}
