//
//  ObjCViewController.m
//  ObjCSwiftDemo
//
//  Created by Jon Flanders on 1/30/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

#import "ObjCViewController.h"

@interface ObjCViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
