//
//  ViewController.h
//  Example
//
//  Created by iosdev on 19/08/14.
//  Copyright (c) 2014 TestPlus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraphView.h"

@interface ViewController : UIViewController <BEMSimpleLineGraphDataSource, BEMSimpleLineGraphDelegate>
@property NSMutableArray *arrayOfRate;
@property NSMutableArray *arrayOfTime;
@property (weak, nonatomic) IBOutlet UILabel *bpmLabel;
@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *myGraph;
@property (weak, nonatomic) IBOutlet UIButton *optionBtn;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;
@end
