//
//  ViewController.m
//  ObjCSwiftDemo
//
//  Created by Jon Flanders on 1/30/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

#import "ViewController.h"
#import "ObjCSwiftDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	UIViewController* vc = segue.destinationViewController;
	SwiftViewController* svc = vc;
	svc.data = @"Hi From Objective-C";
	
	//svc.label.text = @"Hi From ObjC";
}
-(IBAction)back:(UIStoryboardSegue*)sender{
	
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
