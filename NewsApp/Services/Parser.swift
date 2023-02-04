
import Foundation

//MARK: Decoder protocol
protocol DecoderProtocol {
    func decodeData(_ data: Data?, completion: @escaping (_ employee: Welcome)->())
}

//MARK: Decoder class
class Decoder: DecoderProtocol {
    
    //MARK: DecoderProtocol methods:
    func decodeData(_ data: Data?, completion: @escaping (Welcome) -> ()) {
        if let localData = data {
            do {
                let welcome = try JSONDecoder().decode(Welcome.self, from: localData)
//                let model = welcome.company.employees
                completion(welcome)
            } catch let error {
                print("Error serialization JSON ", error.localizedDescription)
            }
        } else {
            print("Data received by Decoder is empty (nil).")
        }
    }
    
}
