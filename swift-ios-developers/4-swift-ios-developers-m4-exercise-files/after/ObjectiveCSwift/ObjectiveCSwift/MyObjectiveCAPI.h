//
//  MyObjectiveCAPI.h
//  ObjectiveCSwift
//
//  Created by Jon Flanders on 2/15/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

@import Foundation;
@import UIKit;


@interface MyObjectiveCAPI : NSObject
-(NSArray<NSString*>* _Nonnull)getArray;
-(NSDictionary<NSString*,NSString*>* _Nullable)getDictionary;
-(__kindof UIView* _Nonnull)getView;
@end
