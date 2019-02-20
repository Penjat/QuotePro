

import UIKit


class APIManager{
  
  static func getQuote(closure:@escaping (String,String)->Void){
    //TODO pass in closure
    
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
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            closure(quoteText,quoteAuthor)
          }
        }else{
          print("error, was not able to get the quote")
        }
      }
    })
    
    dataTask.resume()
  }
  
  static func getRandBackground(closure:@escaping (UIImage)->Void){
    let headers = [
      "cache-control": "no-cache",
      "Postman-Token": "7b6e186f-4a42-485e-b0e0-d2e2676b22e6"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "http://lorempixel.com/400/200/")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error)
      } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
        if let image = UIImage(data: data!){
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            closure(image)
          }
        }else{
          print("could not get the image")
        }
      }
    })
    
    dataTask.resume()
  }
}
