
import Foundation

//MARK: Decoder protocol
protocol DecoderProtocol {
    func decodeData(_ data: Data?, completion: @escaping (_ characters: [Character])->())
}

//MARK: Decoder class
class Decoder: DecoderProtocol {
    
    //MARK: DecoderProtocol methods:
    func decodeData(_ data: Data?, completion: @escaping ([Character]) -> ()) {
        if let localData = data {
            do {
                let welcome = try JSONDecoder().decode(RickAndMorty.self, from: localData)
                let characters = welcome.results
                completion(characters)
            } catch let error {
                print("Error serialization JSON ", error.localizedDescription)
            }
        } else {
            print("Data received by Decoder is empty (nil).")
        }
    }
    
}
