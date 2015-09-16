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

    private let red = UIColor.redColor()
    private let cyan = UIColor.cyanColor()
    
    private let bold = UIFont(name: "Courier-Bold", size: 15)!
    private let italic = UIFont(name: "Courier-Oblique", size: 15)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        let title = titleAt(0)
        title.font = UIFont(name: "Courier-Bold", size: 25)
        title.textColor = UIColor.yellowColor()
        title.text = "UILabel+FormattedText"
        title.setTextUnderline(UIColor.yellowColor(), range: title.fullRange())

        // RANGES
        
        let title1 = titleAt(1)
        title1.text = "Formatting w/ Ranges"
        
        // Colors
        let label11 = labelAt(2)
        label11.text = "This is a text with\nRED and CYAN"
        label11.setTextColor(red, range: NSMakeRange(20, 3))
        label11.setTextColor(cyan, range: NSMakeRange(28, 4))
        
        // Fonts
        let label12 = labelAt(3)
        label12.text = "This is a text with\nBOLD and ITALIC"
        label12.setFont(bold, range: NSMakeRange(20, 4))
        label12.setFont(italic, range: NSMakeRange(29, 6))

        // Underline
        let label13 = labelAt(4)
        label13.text = "This is a text with\nFULL UNDERLINE and UNDERLINE BY WORD"
        label13.setTextUnderline(red, range: NSMakeRange(20, 14))
        label13.setTextUnderline(cyan, range: NSMakeRange(39, 17), byWord: true)
        
        // Remove Underline
        let label14 = labelAt(5)
        label14.text = "This is an underlined text with a NON UNDERLINED part"
        label14.setTextUnderline(cyan, range: label14.fullRange())
        label14.setTextWithoutUnderline(range: NSMakeRange(33, 16))
        
        // STRING MATCHERS
        
        let title2 = titleAt(6)
        title2.text = "Formatting w/ String Matchers"
        
        // After & Before
        let label21 = labelAt(7)
        label21.text = "Bold after THIS. Red before THAT. Underline after *THIS* and before *THAT*"
        label21.setFont(bold, range: label21.rangeAfter("THIS"))
        label21.setTextColor(red, range: label21.rangeBefore("THAT"))
        label21.setTextUnderline(cyan, range: label21.rangeAfter("*THIS*", before: "*THAT*"))
        
        // From & To
        let label22 = labelAt(8)
        label22.text = "Bold from THIS. Red to THAT. Underline from *THIS* and to *THAT*"
        label22.setFont(bold, range: label22.rangeFrom("THIS"))
        label22.setTextColor(red, range: label22.rangeTo("THAT"))
        label22.setTextUnderline(cyan, range: label22.rangeFrom("*THIS*", to: "*THAT*"))
        
        // String
        let label23 = labelAt(9)
        label23.text = "This is a text with\nRED, BOLD and UNDERLINE"
        label23.setTextColor(red, range: label23.rangeOf("RED"))
        label23.setFont(bold, range: label23.rangeOf("BOLD"))
        label23.setTextUnderline(cyan, range: label23.rangeOf("UNDERLINE"))
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    private func titleAt(index: Int) -> UILabel {
        let y = sep + (hei + sep) * CGFloat(index)
        
        let title = UILabel(frame: CGRect(x: 0, y: y, width: view.frame.width, height: hei))
        title.textColor = UIColor.whiteColor()
        title.font = UIFont(name: "Courier-Bold", size: 18)
        title.textAlignment = .Center
        view.addSubview(title)
        
        return title
    }
    
    private func labelAt(index: Int) -> UILabel {
        let y = sep + (hei + sep) * CGFloat(index)
        
        let label = UILabel(frame: CGRect(x: 0, y: y, width: view.frame.width, height: hei))
        label.textAlignment = .Center
        label.textColor = UIColor.yellowColor()
        label.font = UIFont(name: "Courier", size: 15)
        label.numberOfLines = 0
        view.addSubview(label)
        
        return label
    }
}
