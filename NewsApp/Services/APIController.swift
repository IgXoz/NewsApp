import Foundation


protocol APIControllerProtocol {
//    func loadCachedData(_ fileUrl: URL?, completion: @escaping (_ data: Data)->())
    func loadDataFromServer(completion: @escaping (_ data: Data)->())
}

class APIController: APIControllerProtocol {
    
    // MARK: - Private properties:

    
    // MARK: - APIControllerProtocol methods:

//    Loads Data from cache and returns Data.
    func loadCachedData(_ fileUrl: URL?, completion: @escaping (_ data: Data)->()) {
        if let url = fileUrl {
            URLSession.shared.dataTask(with: url) { data, responce, error in
                guard let data = data else {
                    print(error?.localizedDescription ??
                          "No error description. Cannot load Data from cache.")
                    return}
                completion(data)
            } .resume()
        } else {
            print("No valid URL for cached file.")
        }
    }
    
    //Loads Data from server and returns Data.
    func loadDataFromServer(completion: @escaping (_ data: Data)->()) {
        guard let url = URL(string: NetworkConstants.apiAdress) else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data else {
                print(error?.localizedDescription ??
                      "No error description. Cannot load Data from server.")
                return }
            completion(data)
        } .resume()
    }
}



