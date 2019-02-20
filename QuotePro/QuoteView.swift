

import UIKit

class QuoteView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var quoteText: UILabel!
  @IBOutlet weak var authorText: UILabel!
  @IBOutlet weak var backgroundImg: UIImageView!
  
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
  func update(quote:String , author:String){
    quoteText.text = quote
    authorText.text = author
  }
  func update(image:UIImage){
    backgroundImg.image = image
  }
  

}
