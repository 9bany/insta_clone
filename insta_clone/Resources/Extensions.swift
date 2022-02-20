//
//  Extensions.swift
//  insta_clone
//
//  Created by bany on 11/02/2022.
//

import Foundation
import UIKit

extension UIView {
   
   public var width: CGFloat {
      return self.frame.width
   }
   
   public var height: CGFloat {
      return self.frame.height
   }
   
   public var top: CGFloat {
      return self.frame.origin.y
   }
   
   public var bottom: CGFloat {
      return self.frame.origin.y + self.frame.height
   }
   
   public var left: CGFloat {
      return self.frame.origin.x
   }
   
   public var right: CGFloat {
      return self.frame.origin.x + self.frame.width
   }
}
