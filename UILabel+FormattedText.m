//
//  UILabel+FormattedText.m
//  UILabel+FormattedText
//
//  Created by Joao Costa on 3/1/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "UILabel+FormattedText.h"

@implementation UILabel (FormattedText)

- (void)setTextColor:(UIColor *)textColor range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSForegroundColorAttributeName
                 value: textColor
                 range: range];
    
    [self setAttributedText: text];
}

- (void)setFont:(UIFont *)font range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSFontAttributeName
                 value: font
                 range: range];
    
    [self setAttributedText: text];
}

- (void)setTextColor:(UIColor *)textColor beforeOccurenceOfString:(NSString*)separator{

    NSRange range = [self.text rangeOfString:separator];

    if (range.location != NSNotFound)
    {
        range.length = range.location;
        range.location = 0;
        [self setTextColor:textColor range:range];
    }
}

- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator{

    NSRange range = [self.text rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.length = self.text.length - range.location;
        [self setTextColor:textColor range:range];
    }
}

- (void)setFont:(UIFont *)font beforeOccurenceOfString:(NSString*)separator{

    NSRange range = [self.text rangeOfString:separator];

    if (range.location != NSNotFound)
    {
        range.length = range.location;
        range.location = 0;
        [self setFont:font range:range];
    }
}

- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self.text rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.length = self.text.length - range.location;
        [self setFont:font range:range];
    }
}


- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString
{
    NSRange range = [self.text rangeOfString:searchString];
    if (range.location != NSNotFound)
    {
        [self setTextColor:textColor range:range];
    }
}


- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString underLineColor:(UIColor*)underlineColor
{
    NSRange range = [self.text rangeOfString:searchString];
    if (range.location != NSNotFound)
    {
        [self setTextColor:textColor range:range];
        [self setTextUnderLine:underlineColor range:range];
    }
}


- (void)setTextUnderLine:(UIColor *)lineColor range:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    
    [text addAttribute:NSUnderlineStyleAttributeName
                 value:@(NSUnderlineStyleSingle|NSUnderlineByWord) //[NSNumber numberWithInt:NSSingleUnderlineStyle]
                 range:range];

    [text addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
    self.attributedText = text;
}


- (void)setTextWithoutUnderLineInRange:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];

    [text removeAttribute:NSUnderlineStyleAttributeName
                    range:range];

    self.attributedText = text;
}


- (void)setTextColor:(UIColor *)textColor fromOccurenceOfString:(NSString*)separator1 toOccurenceOfString:(NSString*)separator2
{
    NSRange rangeFrom = [self.text rangeOfString:separator1];
    NSRange rangeTo = [self.text rangeOfString:separator2 options:0 range:NSMakeRange(rangeFrom.location,self.text.length-rangeFrom.location)];
    
    if (rangeFrom.location != NSNotFound)
    {
        if ( rangeTo.location == NSNotFound)
            rangeFrom.length = self.text.length - rangeFrom.location;
        else
            rangeFrom.length = rangeTo.location - rangeFrom.location;
        
        
        [self setTextColor:textColor range:rangeFrom];
        
        if ([textColor isEqual:[UIColor clearColor]] == YES)
        {
            [self setTextUnderLine:[UIColor blueColor] range:rangeFrom];
        }
    }
}

@end
