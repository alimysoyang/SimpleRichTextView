//
//  AUIRichTextView.swift
//  SimpleRichTextView
//
//  Created by alimysoyang on 14/12/28.
//  Copyright (c) 2014年 AlimysoYang. All rights reserved.
//

import UIKit

class AUIRichTextView:UITextView
{
    var content:String?;
    
    //this function must write
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer);
    }
    
    init(frame: CGRect, textViewContent:String?)
    {
        super.init(frame: frame);
        self.content = textViewContent;
        
        let textAttech1:NSTextAttachment = NSTextAttachment();
        textAttech1.image = UIImage(named: "face1");
        var imageframe:CGRect = textAttech1.bounds;
        imageframe.size.width = 30.0;
        imageframe.size.height = 30.0;
        textAttech1.bounds = imageframe;
        
        let textAttech2:NSTextAttachment = NSTextAttachment();
        textAttech2.image = UIImage(named: "face2");
        
        let encodeData = self.content?.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true);
        var showContent:NSMutableAttributedString? = NSMutableAttributedString(data: encodeData!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType], documentAttributes: nil, error: nil);
        showContent?.appendAttributedString(NSAttributedString(attachment: textAttech1));
        showContent?.insertAttributedString(NSAttributedString(attachment: textAttech2), atIndex: 0);
        showContent?.insertAttributedString(NSAttributedString(attachment: textAttech1), atIndex: 12);
        
        let contentFrame:CGRect = showContent!.boundingRectWithSize(CGSizeMake(self.frame.size.width, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil);
        println("AttributedString content frame size \(contentFrame)");
        self.attributedText = showContent;
        showContent = nil;
    }
    
    
}