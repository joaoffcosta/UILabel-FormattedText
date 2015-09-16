//
//  ViewController.m
//  UILabel+FormattedText
//
//  Created by Joao Costa on 3/1/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+FormattedText.h"

#define SEP 20
#define HEI 40

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIFont *bold = [UIFont fontWithName:@"Courier-Bold" size:14];
    UIFont *italic = [UIFont fontWithName:@"Courier-Oblique" size:14];
    
    // Colors
    UILabel *label0 = [self labelNo: 0];
    [label0 setText:@"This is a text with\nRED and CYAN"];
    [label0 setTextColor:[UIColor redColor] range:NSMakeRange(20, 3)];
    [label0 setTextColor:[UIColor cyanColor] range:NSMakeRange(28, 4)];

    // Fonts
    UILabel *label1 = [self labelNo: 1];
    [label1 setText:@"This is a text with\nBOLD and ITALIC"];
    [label1 setFont:bold range:NSMakeRange(20, 4)];
    [label1 setFont:italic range:NSMakeRange(29, 6)];
    
    // Colors AND Fonts
    UILabel *label2 = [self labelNo: 2];
    [label2 setText:@"This is a text with\nBOLD-RED and ITALIC-CYAN"];
    [label2 setTextColor:[UIColor redColor] range:NSMakeRange(20, 8)];
    [label2 setFont:bold range:NSMakeRange(20, 8)];
    [label2 setTextColor:[UIColor cyanColor] range:NSMakeRange(33, 11)];
    [label2 setFont:italic range:NSMakeRange(33, 11)];
    
    // Colors AND Fonts AND Underline
    UILabel *label3 = [self labelNo: 3];
    [label3 setText:@"This is a text with\nRED-UNDERLINE and CYAN-UNDERLINE"];
    [label3 setTextColor:[UIColor redColor] range:NSMakeRange(20, 13)];
    [label3 setTextUnderLine:[UIColor cyanColor] range:NSMakeRange(20, 13)];
    [label3 setTextColor:[UIColor cyanColor] range:NSMakeRange(38, 14)];
    [label3 setTextUnderLine:[UIColor redColor] range:NSMakeRange(38, 14)];
    
    // Colors and Remove Underline
    UILabel *label4 = [self labelNo: 4];
    [label4 setText:@"This is an underlined text with\nRED and CYAN"];
    [label4 setTextUnderLine:[UIColor yellowColor] range:NSMakeRange(0, 44)];
    [label4 setTextColor:[UIColor redColor] range:NSMakeRange(32, 3)];
    [label4 setTextWithoutUnderLineInRange:NSMakeRange(32, 3)];
    [label4 setTextColor:[UIColor cyanColor] range:NSMakeRange(40, 4)];
    [label4 setTextWithoutUnderLineInRange:NSMakeRange(40, 4)];
    
    // Changes after occurence
    UILabel *label5 = [self labelNo:5];
    [label5 setText:@"This is a text with\nRED-BOLD after 'RED-BOLD'"];
    [label5 setTextColor:[UIColor redColor] afterOccurenceOfString:@"RED-BOLD"];
    [label5 setFont:bold afterOccurenceOfString:@"RED-BOLD"];

    // Changes before occurence
    UILabel *label6 = [self labelNo:6];
    [label6 setText:@"This is a text with\nRED-BOLD before 'RED-BOLD'"];
    [label6 setTextColor:[UIColor redColor] beforeOccurenceOfString:@"RED-BOLD"];
    [label6 setFont:bold beforeOccurenceOfString:@"RED-BOLD"];
    
    // Changes after and before occurence
    UILabel *label7 = [self labelNo:7];
    [label7 setText:@"This is a text with\nRED from 'RED' to period mark."];
    [label7 setTextColor:[UIColor redColor] fromOccurenceOfString:@"RED" toOccurenceOfString:@"."];
    
    // Changes of precise text
    UILabel *label8 = [self labelNo:8];
    [label8 setText:@"This is a text with\nRED and RED-UNDERLINE using search."];
    [label8 setTextColor:[UIColor redColor] String:@"RED"];
    [label8 setTextColor:[UIColor redColor] String:@"RED-UNDERLINE" underLineColor:[UIColor cyanColor]];
}

- (UILabel *)labelNo:(CGFloat)index {
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(0, SEP + (HEI + SEP) * index, self.view.frame.size.width, HEI)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor yellowColor]];
    [label setFont:[UIFont fontWithName:@"Courier" size:14]];
    [label setNumberOfLines:0];
    [self.view addSubview:label];
    
    return label;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
