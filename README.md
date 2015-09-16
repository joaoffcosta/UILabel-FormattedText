UILabel+FormattedText
=====================

An iOS UILabel extension to enable easy definition of multiple colors, fonts and styles in a single label.
This extension is written in Swift 2.0.

![Example Screen Capture](https://github.com/joaoffcosta/UILabel-FormattedText/blob/master/example.png)

You can find an [outdated] [Objective-C version here](https://github.com/joaoffcosta/UILabel-FormattedText/releases/tag/objective-c).

# Usage Examples
```Swift
// Using String Matchers
label.text = "This text is RED, BOLD and UNDERLINE"
label.setTextColor(UIColor.redColor(), string: "RED")
label.setFont(UIFont.boldFont(), string: "BOLD")
label.setTextUnderline(color: UIColor.redColor(), string: "UNDERLINE")
```

```Swift
// Using Ranges
label.text = "This text is RED, BOLD and UNDERLINE"
label.setTextColor(UIColor.redColor(), range: NSMakeRange(13, 3))
label.setFont(UIFont.boldFont(), range: NSMakeRange(18, 4))
label.setTextUnderline(color: UIColor.redColor(), range: NSMakeRange(27, 9))
```

```Swift
// Using Before & After Matchers
label.text = "My name is John Doe and I love jello"
label.setFont(UIFont.italicFont(), after: " is ", before: " and ")
label.setTextUnderline(UIColor.whiteColor(), after: " and ")
```

```Swift
// Using From & To Matchers
label.text = "You are playing Level #3"
label.setFont(UIFont.boldFont(), from: "Level")
label.setTextColor(UIColor.yellowColor(), from: "playing")
```
