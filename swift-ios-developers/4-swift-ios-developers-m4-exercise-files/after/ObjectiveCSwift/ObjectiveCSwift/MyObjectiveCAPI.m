//
//  MyObjectiveCAPI.m
//  ObjectiveCSwift
//
//  Created by Jon Flanders on 2/15/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

#import "MyObjectiveCAPI.h"

@implementation MyObjectiveCAPI
-(instancetype)init{
	self = [super init];
	
	return self;
}
-(void)doSomething{
	
	[[self getView] setTitle:@"Hello" forState:UIControlStateNormal];
}
- (NSArray *)getArray{
	return @[@"Foo",@"Bar"];
}
-(UIView*)getView{
	return [[UIView alloc] init];
}
- (NSDictionary *)getDictionary{
	NSDictionary* ret = nil;
	int r = arc4random_uniform(42);
	if( r%2==0){
		ret = @{@"Foo":@"Bar",@"Quux":@"Baz"};
	}
	return ret;
}
@end
