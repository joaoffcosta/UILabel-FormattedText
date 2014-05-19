//
//  UILabel+FormattedText.h
//  UILabel+FormattedText
//
//  Created by Joao Costa on 3/1/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FormattedText)

- (void)setTextColor:(UIColor *)textColor range:(NSRange)range;
- (void)setFont:(UIFont *)font range:(NSRange)range;

- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator;

@end
