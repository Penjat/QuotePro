
import UIKit

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
 
  
  @IBOutlet weak var quoteTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      quoteTableView.dataSource = self
      quoteTableView.delegate = self
    }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! QuoteCell
    return cell
  }

  
}
