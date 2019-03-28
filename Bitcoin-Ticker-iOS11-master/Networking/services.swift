import Foundation
import  Alamofire

func dataRequest<T: Decodable>(  decodingType: T.Type,success successCallback :  @escaping ( _ dataModel : T )->()) {
    
    let requsetUrl =  "https://blockchain.info/ticker"
    var request = URLRequest(url: URL(string: requsetUrl)!)
    request.httpMethod = HTTPMethod.get.rawValue
    
    if  NetworkReachabilityManager()!.isReachable{
        Alamofire.request(request).responseJSON {
            (response) in
            print(response)
            if let value = response.result.value {
                print(value)
                do {
                    if let dataDict = try? JSONSerialization.jsonObject(with: response.data!   , options: JSONSerialization.ReadingOptions.allowFragments) {
                        print(dataDict)
                        let   model : T =   try JSONDecoder().decode(decodingType.self, from: response.data!)
                        successCallback(model)
                        
                    }
                } catch let error {
                    print(error)
                    
                }
            }
        }
    }else{
        print("network error")
    }
}

