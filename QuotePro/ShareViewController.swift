

import UIKit

class ShareViewController: UIViewController {
  @IBOutlet weak var quoteView: QuoteView!
  
  
  var quote :Quote?
    override func viewDidLoad() {
        super.viewDidLoad()
      if let quote = quote{
        quoteView.update(quote: quote.text!, author: quote.author!)
        quoteView.update(image: UIImage(data: quote.imageData!)! )
      }
      
    }
  @IBAction func pressedShare(_ sender: Any) {
    share()
  }
  func share(){
    let image = snapshot(view: quoteView)
    guard image != nil else{
      print("could not share image")
      return
    }
    let items = [image]
    let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
    present(ac, animated: true)
  }

  func snapshot(view:UIView)->UIImage?{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    return image
  }
  
  
  

}
