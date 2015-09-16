//
//  ViewController.swift
//  UILabel+FormattedText
//
//  Created by João Costa on 16/09/15.
//
//

import UIKit

class ViewController: UIViewController {
    private let sep: CGFloat = 20
    private let hei: CGFloat = 40
    
    private let yellow = UIColor.yellowColor()
    private let red = UIColor.redColor()
    private let cyan = UIColor.cyanColor()
    
    private let regular = UIFont(name: "Courier", size: 15)!
    private let bold = UIFont(name: "Courier-Bold", size: 15)!
    private let italic = UIFont(name: "Courier-Oblique", size: 15)!
    
    private var views = [(String, UIView)]()
    private var index: Int = 0
    private var presented: UIView?
    private var previous: UIButton?
    private var next: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        let title = titleAt(0, view: view)
        title.font = UIFont(name: "Courier-Bold", size: 25)
        title.textColor = yellow
        title.text = "UILabel+FormattedText"
        title.setTextUnderline(yellow, range: title.fullRange())
        
        views = [
            ("Ranges", rangesView()),
            ("At String", atStringView()),
            ("After & Before", afterBeforeView()),
            ("From & To", fromToView())
        ]
        
        let bY = view.frame.height - sep - hei
        let bWidth = view.frame.width / 2 - sep
        
        previous = UIButton(frame: CGRect(x: sep, y: bY, width: bWidth, height: hei))
        previous?.titleLabel?.font = regular
        previous?.setTitleColor(yellow, forState: .Normal)
        previous?.contentHorizontalAlignment = .Left
        previous?.addTarget(self, action: "previousButtonTapped", forControlEvents: .TouchUpInside)
        view.addSubview(previous!)
        
        next = UIButton(frame: CGRect(x: sep + bWidth, y: bY, width: bWidth, height: hei))
        next?.titleLabel?.font = regular
        next?.setTitleColor(yellow, forState: .Normal)
        next?.contentHorizontalAlignment = .Right
        next?.addTarget(self, action: "nextButtonTapped", forControlEvents: .TouchUpInside)
        view.addSubview(next!)
        
        refreshState()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func refreshState() {
        for (_, view) in views { view.hidden = true }
        
        presented = views[index].1
        presented?.hidden = false
        
        previous?.hidden = true
        next?.hidden = true
        
        if index > 0 {
            previous?.hidden = false
            previous?.setTitle("< \(views[index - 1].0)", forState: .Normal)
        }
        
        if index < views.count - 1 {
            next?.hidden = false
            next?.setTitle("\(views[index + 1].0) >", forState: .Normal)
        }
    }
    
    func previousButtonTapped() {
        index = max(0, index - 1)
        refreshState()
    }
    
    func nextButtonTapped() {
        index = min(views.count - 1, index + 1)
        refreshState()
    }
    
    private func rangesView() -> UIView {
        let aview = contentView()
        let title1 = titleAt(0, view: aview)
        title1.text = "Formatting w/ Ranges"
        
        // Colors
        let label1 = labelAt(1, view: aview)
        label1.text = "This is a text with\nRED and CYAN."
        label1.setTextColor(red, range: NSMakeRange(20, 3))
        label1.setTextColor(cyan, range: NSMakeRange(28, 4))
        
        // Fonts
        let label2 = labelAt(2, view: aview)
        label2.text = "This is a text with\nBOLD and ITALIC"
        label2.setFont(bold, range: NSMakeRange(20, 4))
        label2.setFont(italic, range: NSMakeRange(29, 6))
        
        // Underline
        let label3 = labelAt(3, view: aview)
        label3.text = "This is a text with\nFULL UNDERLINE and UNDERLINE BY WORD"
        label3.setTextUnderline(red, range: NSMakeRange(20, 14))
        label3.setTextUnderline(cyan, range: NSMakeRange(39, 17), byWord: true)
        
        return aview
    }
    
    private func atStringView() -> UIView {
        let aview = contentView()
        let title1 = titleAt(0, view: aview)
        title1.text = "Formatting w/ At String"
        
        // Colors
        let label1 = labelAt(1, view: aview)
        label1.text = "This is a text with\nRED and CYAN."
        label1.setTextColor(red, string: "RED")
        label1.setTextColor(cyan, string: "CYAN")
        
        // Fonts
        let label2 = labelAt(2, view: aview)
        label2.text = "This is a text with\nBOLD and ITALIC"
        label2.setFont(bold, string: "BOLD")
        label2.setFont(italic, string: "ITALIC")
        
        // Underline
        let label3 = labelAt(3, view: aview)
        label3.text = "This is a text with\nFULL UNDERLINE and UNDERLINE BY WORD"
        label3.setTextUnderline(red, string: "FULL UNDERLINE")
        label3.setTextUnderline(cyan, string: "UNDERLINE BY WORD", byWord: true)
        
        return aview
    }
    
    private func afterBeforeView() -> UIView {
        let aview = contentView()
        let title1 = titleAt(0, view: aview)
        title1.text = "Formatting w/ After & Before"
        
        // After
        let label1 = labelAt(1, view: aview)
        label1.text = "The after text is:\nRED with some BOLD and UNDERLINE."
        label1.setTextColor(red, after: "RED")
        label1.setFont(bold, after: "BOLD")
        label1.setTextUnderline(red, after: "UNDERLINE")
        
        // Before
        let label2 = labelAt(2, view: aview)
        label2.text = "This before text is:\nRED with some BOLD and UNDERLINE."
        label2.setTextColor(red, before: "RED")
        label2.setFont(bold, before: "BOLD")
        label2.setTextUnderline(red, before: "UNDERLINE")
        
        // After & Before
        let label3 = labelAt(3, view: aview)
        label3.text = "The following text is:\nRED and BOLD and UNDERLINE."
        label3.setTextColor(red, after: "\n", before: ".")
        label3.setFont(bold, after: "\n", before: ".")
        label3.setTextUnderline(red, after: "\n", before: ".")
        
        return aview
    }
    
    private func fromToView() -> UIView {
        let aview = contentView()
        let title1 = titleAt(0, view: aview)
        title1.text = "Formatting w/ From & To"
        
        // After
        let label1 = labelAt(1, view: aview)
        label1.text = "The text from these points is:\nRED with some BOLD and UNDERLINE."
        label1.setTextColor(red, from: "RED")
        label1.setFont(bold, from: "BOLD")
        label1.setTextUnderline(red, from: "UNDERLINE")
        
        // Before
        let label2 = labelAt(2, view: aview)
        label2.text = "The text to these points is:\nRED with some BOLD and UNDERLINE."
        label2.setTextColor(red, to: "RED")
        label2.setFont(bold, to: "BOLD")
        label2.setTextUnderline(red, to: "UNDERLINE")
        
        // After & Before
        let label3 = labelAt(3, view: aview)
        label3.text = "The following text is:\nRED and BOLD and UNDERLINE."
        label3.setTextColor(red, from: "RED", to: "UNDERLINE")
        label3.setFont(bold, from: "RED", to: "UNDERLINE")
        label3.setTextUnderline(red, from: "RED", to: "UNDERLINE")
        
        return aview
    }
    
    private func contentView() -> UIView {
        let aview = UIView(frame: CGRect(x: 0, y: 2 * sep + hei, width: view.frame.width, height: view.frame.height - 2 * sep + hei))
        view.addSubview(aview)
        return aview
    }
    
    private func titleAt(index: Int, view: UIView) -> UILabel {
        let y = sep + (hei + sep) * CGFloat(index)
        
        let title = UILabel(frame: CGRect(x: 0, y: y, width: view.frame.width, height: hei))
        title.textColor = UIColor.whiteColor()
        title.font = UIFont(name: "Courier-Bold", size: 18)
        title.textAlignment = .Center
        view.addSubview(title)
        
        return title
    }
    
    private func labelAt(index: Int, view: UIView) -> UILabel {
        let y = sep + (hei + sep) * CGFloat(index)
        
        let label = UILabel(frame: CGRect(x: 0, y: y, width: view.frame.width, height: hei))
        label.textAlignment = .Center
        label.textColor = yellow
        label.font = regular
        label.numberOfLines = 0
        view.addSubview(label)
        
        return label
    }
}
