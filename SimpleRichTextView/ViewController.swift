//
//  ViewController.swift
//  SimpleRichTextView
//
//  Created by alimysoyang on 14/12/28.
//  Copyright (c) 2014年 AlimysoYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var labTip:UILabel? = UILabel(frame: CGRectMake(10.0, 75.0, 100.0, 20.0));
        labTip?.backgroundColor = UIColor.clearColor();
        labTip?.text = "UITextView";
        self.view.addSubview(labTip!);
        labTip = nil;
        
        var richTextView:AUIRichTextView? = AUIRichTextView(frame: CGRectMake(0.0, 100.0, self.view.frame.size.width, 100.0), textViewContent: "<font color=\"#00f900\">Hello</font> Rich Text,with a lot of Pictures");
        self.view.addSubview(richTextView!);
        
        labTip = UILabel(frame: CGRectMake(10.0, 205.0, 100.0, 20.0));
        labTip?.backgroundColor = UIColor.clearColor();
        labTip?.text = "UIWebView";
        self.view.addSubview(labTip!);
        labTip = nil;
        
        var webView:UIWebView? = UIWebView(frame: CGRectMake(0.0, 230.0, self.view.frame.size.width, 100.0));
        let htmlContent:String = "<html><div id='foo'><img src=\"face1@2x.png\" width=\"30\" height=\"30\"><font size=\"5\" color=\"#f9f900\">Use UIWebView</font> show HTML String,<img src=\"face2@2x.png\" width=\"50\" height=\"50\">use local resource image files</div></html>";
        webView?.loadHTMLString(htmlContent, baseURL: NSBundle.mainBundle().resourceURL);
        webView?.delegate = self;
        self.view.addSubview(webView!);
        webView = nil;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func webViewDidFinishLoad(webView: UIWebView) {
        //Calculate the height of the content
        let htmlHeight:String = webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"foo\").offsetHeight;")!;
        println("Calculate the height of the content in the webview \(htmlHeight)");
    }
}

