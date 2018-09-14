//
//  UILabel+FormattedText.swift
//  UILabel+FormattedText
//
//  Created by João Costa on 16/09/15.
//  Update by João Costa on 14/09/18.
//
//

import Foundation
import UIKit

extension UILabel {

    public var fullRange: NSRange { return NSMakeRange(0, text?.count ?? 0) }

    public func range(string: String) -> NSRange? {
        let range = NSString(string: forceText).range(of: string)
        return range.location != NSNotFound ? range : nil
    }

    public func range(after string: String) -> NSRange? {
        guard var range = range(string: string) else { return nil }
        range.location = range.location + range.length
        range.length = forceText.count - range.location
        return range
    }

    public func range(before string: String) -> NSRange? {
        guard var range = range(string: string) else { return nil }
        range.length = range.location
        range.location = 0
        return range
    }

    public func range(after: String, before: String) -> NSRange? {
        guard let rAfter = range(after: after),
            let rBefore = range(before: before),
            rAfter.location < rBefore.length
            else { return nil }
        return NSMakeRange(rAfter.location, rBefore.length - rAfter.location)
    }

    public func range(fromBeginningOf string: String) -> NSRange? {
        guard var range = range(string: string) else { return nil }

        range.length = forceText.count - range.location
        return range
    }

    public func range(untilEndOf string: String) -> NSRange? {
        guard var range = range(string: string) else { return nil }
        range.length = range.location + range.length
        range.location = 0
        return range
    }

    public func range(fromBeginningOf beginString: String, untilEndOf endString: String) -> NSRange? {
        guard let rBegin = range(fromBeginningOf: beginString),
            let rEnd = range(untilEndOf: endString),
            rBegin.location < rEnd.length
            else { return nil }
        return NSMakeRange(rBegin.location, rEnd.length - rBegin.location)
    }

    // MARK: Range Formatter

    public func set(textColor: UIColor, range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString
        text.addAttribute(.foregroundColor, value: textColor, range: range)
        attributedText = text
    }

    public func set(font: UIFont, range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString
        text.addAttribute(.font, value: font, range: range)
        attributedText = text
    }

    public func set(underlineColor: UIColor, range: NSRange?, byWord: Bool = false) {
        guard let range = range else { return }
        let text = mutableAttributedString
        var style = NSUnderlineStyle.styleSingle.rawValue
        if byWord { style = style | NSUnderlineStyle.byWord.rawValue }
        text.addAttribute(.underlineStyle, value: NSNumber(value: style), range: range)
        text.addAttribute(.underlineColor, value: underlineColor, range: range)
        attributedText = text
    }

    public func setTextWithoutUnderline(_ range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString
        text.removeAttribute(.underlineStyle, range: range)
        attributedText = text
    }

    // MARK: Helpers

    private var forceText: String { return text ?? "" }

    private var mutableAttributedString: NSMutableAttributedString {
        if let attr = attributedText {
            return NSMutableAttributedString(attributedString: attr)
        } else {
            return NSMutableAttributedString(string: forceText)
        }
    }
}
