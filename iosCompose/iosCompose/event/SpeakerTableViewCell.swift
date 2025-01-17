//
//  SpeakerTableViewCell.swift
//  ios
//
//  Created by Sahil Ishar on 3/15/16.
//  Copyright © 2016 Kevin Galligan. All rights reserved.
//

import UIKit
import Kingfisher
import shared

class SpeakerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var infoLabel : UITextView!
    @IBOutlet weak var speakerImage: UIImageView!
    @IBOutlet weak var speakerImageLabel: UILabel!
    
    func loadInfo(_ name: String, info: String, imgUrl: String) {
        nameLabel.text = name
        infoLabel.text = info//formatHTMLString(info)
        
        if (!imgUrl.isEmpty) {
            speakerImage.kf.setImage(with: URL(string: imgUrl)!)
            speakerImage.layer.cornerRadius = 24
            speakerImage.layer.masksToBounds = true
        } else {
            speakerImageLabel.text = ""
        }
    
        nameLabel.sizeToFit()
        infoLabel.sizeToFit()
        speakerImage.sizeToFit()
        speakerImageLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func formatHTMLString(_ htmlString: String) -> NSAttributedString {
        let modifiedFont = NSString(format:"<span style=\"font: -apple-system-body; font-size: 12px\">%@</span>", htmlString) as String
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
//            options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8],
            documentAttributes: nil)
        
        return attrStr
    }
}
