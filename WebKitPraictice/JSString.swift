//
//  JSString.swift
//  WebKitPraictice
//
//  Created by Ryan Kanno on 7/8/21.
//

import Foundation

struct JSString {
   static let mySwitch = """
      var _selector = document.querySelector('input[name=myCheckbox]');
      _selector.addEventListener('change', function(event) {
         var message = (_selector.checked) ? "Toggle Switch is on" : "Toggle Switch is off";
         if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.toggleMessageHandler) {
            window.webkit.messageHandlers.toggleMessageHandler.postMessage({
               "message": message
            });
         }
      });
   """
}
