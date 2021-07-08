//
//  WebViewController.swift
//  WebKitPraictice
//
//  Created by Ryan Kanno on 7/7/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
   //   var url = URL(string: "https://www.apple.com")
   private lazy var webview: WKWebView = {
      let webview = WKWebView()
      webview.translatesAutoresizingMaskIntoConstraints = false
      return webview
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()      
      view.backgroundColor = .systemBackground
      
      view.addSubview(webview)
      let layoutGuide = view.safeAreaLayoutGuide
      webview.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
      webview.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
      webview.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
      webview.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
      webview.allowsBackForwardNavigationGestures = true
      
      let contentController = webview.configuration.userContentController
      contentController.add(self, name: "toggleMessageHandler")
      
      let script = WKUserScript(source: JSString.mySwitch, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
      contentController.addUserScript(script)
      
      if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
         webview.load(URLRequest(url: url))
      }
      
   }
   
}

extension WebViewController: WKScriptMessageHandler {
   func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
      guard let dict = message.body as? [String: AnyObject] else { return }
      print(dict)
      
      guard let messageFromDict = dict["message"] else { return }
      let script = "document.getElementById('value').innerText = \"\(messageFromDict)\""
      webview.evaluateJavaScript(script) { result, err in
         if let result = result {
            print("Label updated with message: \(result)")
         } else if let error = err {
            print("Error occurred: \(error)")
         }
      }
   }
}
