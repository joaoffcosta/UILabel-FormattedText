//
//  UILabel+FormattedText.swift
//  UILabel+FormattedText
//
//  Created by João Costa on 16/09/15.
//
//

import Foundation
import UIKit

extension UILabel {
    
    func fullRange() -> NSRange {
        return NSMakeRange(0, (text ?? "").characters.count)
    }

    // MARK: Range
    
    func setTextColor(color: UIColor, range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        text.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        attributedText = text
    }
    
    func setFont(font: UIFont, range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        text.addAttribute(NSFontAttributeName, value: font, range: range)
        attributedText = text
    }
    
    func setTextUnderline(color: UIColor, range: NSRange?) {
        setTextUnderline(color, range: range, byWord: false)
    }

    func setTextUnderline(color: UIColor, range: NSRange?, byWord: Bool) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        var style = NSUnderlineStyle.StyleSingle.rawValue
        if byWord { style = style | NSUnderlineStyle.ByWord.rawValue }
        text.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(integer: style), range: range)
        text.addAttribute(NSUnderlineColorAttributeName, value: color, range: range)
        attributedText = text
    }
    
    func setTextWithoutUnderline(range range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        text.removeAttribute(NSUnderlineStyleAttributeName, range: range)
        attributedText = text
    }
    
    // MARK: After & Before Range
    
    func rangeAfter(searchString: String) -> NSRange? {
        var range = NSString(string: text ?? "").rangeOfString(searchString)
        
        if range.location != NSNotFound {
            range.location = range.location + range.length
            range.length = text!.characters.count - range.location
            return range
        }
        
        return nil
    }
    
    func rangeBefore(searchString: String) -> NSRange? {
        var range = NSString(string: text ?? "").rangeOfString(searchString)
        
        if range.location != NSNotFound {
            range.length = range.location
            range.location = 0
            return range
        }
        
        return nil
    }
    
    func rangeAfter(after: String, before: String) -> NSRange? {
        guard let rAfter = rangeAfter(after) else { return nil }
        guard let rBefore = rangeBefore(before) else { return nil }
        
        if rAfter.location < rBefore.length {
            return NSMakeRange(rAfter.location, rBefore.length - rAfter.location)
        }
        
        return nil
    }
    
    // MARK: From & To Range
    
    func rangeFrom(searchString: String) -> NSRange? {
        var range = NSString(string: text ?? "").rangeOfString(searchString)
        
        if range.location != NSNotFound {
            range.length = text!.characters.count - range.location
            return range
        }
        
        return nil
    }
    
    func rangeTo(searchString: String) -> NSRange? {
        var range = NSString(string: text ?? "").rangeOfString(searchString)
        
        if range.location != NSNotFound {
            range.length = range.location + range.length
            range.location = 0
            return range
        }
        
        return nil
    }
    
    func rangeFrom(from: String, to: String) -> NSRange? {
        guard let rFrom = rangeFrom(from) else { return nil }
        guard let rTo = rangeTo(to) else { return nil }
        
        if rFrom.location < rTo.length {
            return NSMakeRange(rFrom.location, rTo.length - rFrom.location)
        }
        
        return nil
    }
    
    // MARK: String Range
    
    func rangeOf(searchString: String) -> NSRange? {
        let range = NSString(string: text ?? "").rangeOfString(searchString)
        return range.location != NSNotFound ? range : nil
    }
    
    // MARK: Helpers
    
    private func mutableAttributedString() -> NSMutableAttributedString {
        if attributedText != nil {
            return NSMutableAttributedString(attributedString: attributedText!)
        } else {
            return NSMutableAttributedString(string: text ?? "")
        }
    }
}
