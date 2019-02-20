
import UIKit
import CoreData

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
 var quotes = [Quote]()
  var curCellIndex = -1
  
  @IBOutlet weak var quoteTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      quoteTableView.dataSource = self
      quoteTableView.delegate = self
    }
  
  override func viewDidAppear(_ animated: Bool) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let request: NSFetchRequest<Quote> = Quote.fetchRequest()
    let context = appDelegate.persistentContainer.viewContext
//    request.predicate = NSPredicate(format: "ANY name == %@", "level \(curLevelIndex)")
//
    if let results = try? context.fetch(request) , results.count > 0{
      quotes = results
      quoteTableView.reloadData()
    }else{
      print("was unable to load any quotes, maybe there aren't any")
    }
  }
  func tableView(_ tableView: UITableView,
                 willSelectRowAt indexPath: IndexPath) -> IndexPath{
    print("tapped on cell \(indexPath.row)")
    if curCellIndex == indexPath.row{
      curCellIndex = indexPath.row
    }else{
      shareQuote(index: indexPath.row)
    }
    return indexPath
  }
  
  func shareQuote(index:Int){
    
    let quote = quotes[index]
    performSegue(withIdentifier: "toShare", sender: quote)
    
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let shareViewController = segue.destination as? ShareViewController, let quote = sender as? Quote{
      shareViewController.quote = quote
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return quotes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! QuoteCell
    cell.setUp(quote: quotes[indexPath.row])
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.width/2
  }

  
}
