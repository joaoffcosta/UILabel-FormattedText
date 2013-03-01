UILabel-FormattedText
=====================

An iOS UILabel extension to enable easy definition of multiple colors and fonts.

# Usage
```
- (void)setTextColor:(UIColor *)textColor range:(NSRange)range;
- (void)setFont:(UIFont *)font range:(NSRange)range;
```

# Example
```
UILabel *labelCF = [[UILabel alloc] init];
[labelCF setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
[labelCF setBackgroundColor:[UIColor clearColor]];
[labelCF setTextAlignment:NSTextAlignmentCenter];
[labelCF setText:@"This is a text with\nBOLD-RED and ITALIC-CYAN"];
[labelCF setNumberOfLines:2];
[labelCF setTextColor:[UIColor yellowColor]];

[labelCF setFont:[UIFont fontWithName:@"Courier" size:14]];
[labelCF setTextColor:[UIColor redColor] range:NSMakeRange(20, 8)];
[labelCF setFont:[UIFont fontWithName:@"Courier-Bold" size:14] range:NSMakeRange(20, 8)];
[labelCF setTextColor:[UIColor cyanColor] range:NSMakeRange(33, 11)];
[labelCF setFont:[UIFont fontWithName:@"Courier-Oblique" size:14] range:NSMakeRange(33, 11)];

[self.view addSubview:labelCF];
```