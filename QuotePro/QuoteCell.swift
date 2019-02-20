

import UIKit

class QuoteCell: UITableViewCell {
  @IBOutlet weak var quoteView: QuoteView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
  func setUp(quote:Quote){
    //TODO add if let, take out !s
    quoteView.update(quote: quote.text!, author: quote.author!)
    quoteView.update(image: UIImage(data: quote.imageData!)!)
  }

}
