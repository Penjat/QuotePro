

import UIKit
import CoreData

class QuoteCreationViewController: UIViewController {
  @IBOutlet weak var quoteView: QuoteView!
  var author = ""
  var quoteText = ""
  var backgroudImg :UIImage?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let button1 = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: Selector("pressedSave")) 
    self.navigationItem.rightBarButtonItem  = button1
  }
  @objc func pressedSave(){
    print("pressed save")
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    //TODO make an if let
    let context = appDelegate!.persistentContainer.viewContext
    let quote = Quote(context: context)
    
    quote.author = author
    quote.text = quoteText
    //TODO make an if let
    quote.imageData = backgroudImg!.pngData()
    
    appDelegate!.saveContext()
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    pressedRandQuote(self)
    pressedRandBackground(self)
  }
  @IBAction func pressedRandQuote(_ sender: Any) {
    
    let closure = {(quote:String , author:String )->Void in
      print("quote = \(quote) , autor = \(author)")
      self.updateQuoteText(quote: quote, author: author)
      
    }
    APIManager.getQuote(closure: closure)
  }
  
  @IBAction func pressedRandBackground(_ sender: Any) {
    
    let closure = {(image:UIImage)-> Void in
      print("running the closure")
      self.update(image: image)
    }
    APIManager.getRandBackground(closure: closure)
    
  }
  func updateQuoteText(quote:String , author:String){
    print("running the function")
    self.author = author
    self.quoteText = quote
    quoteView.update(quote: quote, author: author)
  }
  func update(image:UIImage){
    self.backgroudImg = image
    quoteView.update(image: image)
  }
}

