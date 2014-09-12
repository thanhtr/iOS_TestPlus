//
//  ViewController.m
//  Example
//
//  Created by iosdev on 19/08/14.
//  Copyright (c) 2014 TestPlus. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize arrayOfRate, arrayOfTime, bpmLabel, myGraph, optionBtn,titleLabel;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    arrayOfRate = [[NSMutableArray alloc] init];
    arrayOfTime = [[NSMutableArray alloc] init];
    titleLabel.title = @"HEART RATE";
    for (int i = 0; i < 5; i++) {
        [arrayOfRate addObject:[NSNumber numberWithInteger:(arc4random() % 41) + 80]]; // Random values for the graph
        [arrayOfTime addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:5 * i]]]; // Dates for the X-Axis of the graph
    }
    
    /* This is commented out because the graph is created in the interface with this sample app. However, the code remains as an example for creating the graph using code.
     BEMSimpleLineGraphView *myGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 60, 320, 250)];
     myGraph.delegate = self;
     myGraph.dataSource = self;
     [self.view addSubview:myGraph]; */
    
    // Customization of the graph
    myGraph.delegate = self;
    myGraph.dataSource = self;
    myGraph.colorTop = [UIColor whiteColor];
    myGraph.colorBottom = [UIColor whiteColor];
    myGraph.colorLine = [UIColor grayColor];
    myGraph.colorXaxisLabel = [UIColor grayColor];
    myGraph.colorYaxisLabel = [UIColor grayColor];
    myGraph.widthLine = 1.0;
    myGraph.enableTouchReport = YES;
    myGraph.enablePopUpReport = YES;
    myGraph.enableBezierCurve = YES;
    myGraph.enableYAxisLabel = YES;
    myGraph.autoScaleYAxis = YES;
    myGraph.alwaysDisplayDots = NO;
    myGraph.enableReferenceAxisLines = YES;
    myGraph.enableReferenceAxisFrame = YES;
    myGraph.animationGraphStyle = BEMLineAnimationDraw;
    [self.view addSubview:myGraph];

    // The labels to report the values of the graph when the user touches it
    bpmLabel.text = [NSString stringWithFormat:@"%i bpm", [[arrayOfRate objectAtIndex:arrayOfRate.count-1] intValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SimpleLineGraph Data Source

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return (int)[arrayOfRate count];
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    return [[arrayOfRate objectAtIndex:index] floatValue];
}

#pragma mark - SimpleLineGraph Delegate

- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(BEMSimpleLineGraphView *)graph {
    return 0;
}

- (NSString *)lineGraph:(BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index {
    NSString *label = [arrayOfTime objectAtIndex:index];
    return [label stringByReplacingOccurrencesOfString:@" " withString:@"\n"];
}


- (void)lineGraph:(BEMSimpleLineGraphView *)graph didTouchGraphWithClosestIndex:(NSInteger)index {
    
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index {
    
}

- (void)lineGraphDidFinishLoading:(BEMSimpleLineGraphView *)graph {

}



@end
