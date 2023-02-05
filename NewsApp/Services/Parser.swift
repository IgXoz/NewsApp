
import Foundation

//MARK: Decoder protocol
protocol DecoderProtocol {
    func decodeData(_ data: Data?, completion: @escaping (_ article: [Article])->())
}

//MARK: Decoder class
class Decoder: DecoderProtocol {
    
    //MARK: DecoderProtocol methods:
    func decodeData(_ data: Data?, completion: @escaping ([Article]) -> ()) {
        if let localData = data {
            print(data) // delete
            print(localData)// delete
            do {
                print("1")
                let welcome = try JSONDecoder().decode(Welcome.self, from: localData)
                print("2: \(welcome)")// delete
                let articles = welcome.articles
                print("3: \(articles)")// delete
//                completion(articles) ??
                print("4")
            } catch let error {
                print("5")// delete
                print("Error serialization JSON ", error.localizedDescription)
                print("6")// delete
            }
        } else {
            print("Data received by Decoder is empty (nil).")
        }
    }
    
}
