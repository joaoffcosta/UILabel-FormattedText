//
//  ViewController.m
//  UILabel+FormattedText
//
//  Created by Joao Costa on 3/1/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Colors
    UILabel *labelC = [[UILabel alloc] init];
    [labelC setFrame:CGRectMake(0, 0, self.view.frame.size.width, floorf(self.view.frame.size.height / 3))];
    [labelC setBackgroundColor:[UIColor clearColor]];
    [labelC setTextAlignment:NSTextAlignmentCenter];
    [labelC setText:@"This is a text with\nRED and CYAN"];
    [labelC setNumberOfLines:2];
    [labelC setTextColor:[UIColor yellowColor]];
    [labelC setFont:[UIFont fontWithName:@"Courier" size:14]];
    [self.view addSubview:labelC];

    // Fonts
    UILabel *labelF = [[UILabel alloc] init];
    [labelF setFrame:CGRectMake(0, floorf(self.view.frame.size.height / 3), self.view.frame.size.width, floorf(self.view.frame.size.height / 3))];
    [labelF setBackgroundColor:[UIColor clearColor]];
    [labelF setTextAlignment:NSTextAlignmentCenter];
    [labelF setText:@"This is a text with\nBOLD and ITALIC"];
    [labelF setNumberOfLines:2];
    [labelF setTextColor:[UIColor yellowColor]];
    [labelF setFont:[UIFont fontWithName:@"Courier" size:14]];
    [self.view addSubview:labelF];
    

    // Colors AND Fonts
    UILabel *labelCF = [[UILabel alloc] init];
    [labelCF setFrame:CGRectMake(0, floorf(self.view.frame.size.height * 2 / 3), self.view.frame.size.width, floorf(self.view.frame.size.height / 3))];
    [labelCF setBackgroundColor:[UIColor clearColor]];
    [labelCF setTextAlignment:NSTextAlignmentCenter];
    [labelCF setText:@"This is a text with\nBOLD-RED and ITALIC-CYAN"];
    [labelCF setNumberOfLines:2];
    [labelCF setTextColor:[UIColor yellowColor]];
    [labelCF setFont:[UIFont fontWithName:@"Courier" size:14]];
    [self.view addSubview:labelCF];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
