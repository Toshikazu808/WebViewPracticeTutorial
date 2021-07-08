//
//  ViewController.swift
//  WebKitPraictice
//
//  Created by Ryan Kanno on 7/7/21.
//

import UIKit

class ViewController: UIViewController {
   @IBOutlet weak var btn: UIButton!
   @IBOutlet weak var background: UIImageView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      btn.layer.cornerRadius = 5
   }   
   
   @IBAction func displayWebpage(_ sender: UIButton) {
      // Go to WebViewController via Storyboard segue
   }
   
}

