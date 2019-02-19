

import UIKit

class QuoteCreationViewController: UIViewController {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let headers = [
      "cache-control": "no-cache",
      "Postman-Token": "db0c2960-ed6a-4f53-8166-cf5be787da00"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error)
      } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
        
        guard let jsonUnformatted = try? JSONSerialization.jsonObject(with: data!, options: []), let json = jsonUnformatted as? [String:String] else {
          print("data returned is not json, or not valid ")
          return
        }
        print("the json = \(json)")
        if let quoteText = json["quoteText"] as? String, let quoteAuthor =  json["quoteAuthor"] as? String{
          print("quote = \(quoteText) , autor = \(quoteAuthor)")
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //closure(urlString)
          }
        }else{
          print("error, was not able to upload meal photo")
        }
      }
    })
    
    dataTask.resume()
  }
}

