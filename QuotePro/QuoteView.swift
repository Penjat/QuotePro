//
//  QuoteView.swift
//  QuotePro
//
//  Created by Spencer Symington on 2019-02-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class QuoteView: UIView {
  @IBOutlet var contentView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("Quote", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }

}
