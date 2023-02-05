import Foundation

protocol MainDisplayLogicProtocol: AnyObject {
    func reloadData(for section: MainSectionViewModel)
    func presentAlert()
}

protocol MainPresentationLogicProtocol: AnyObject {
    var router: MainRouterProtocol! { set get } // not required for one-screen app.
    func articleDidReceive(with dataStore: MainDataStore)
    func displayData()
    func showAlert()
}

protocol MainBusinessLogicProtocol: AnyObject {
    func loadData()
}

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}

protocol MainRouterProtocol: AnyObject {
// this protocol is not required for one screen app and may be removed.
}
