import Foundation

protocol MainDisplayLogicProtocol: AnyObject {
//    func reloadData(for section: EmployeeSectionViewModel)
    func presentAlert()
}

protocol MainPresentationLogicProtocol: AnyObject {
//    var router: EmployeeRouterProtocol! { set get } // not required for one-screen app.
//    func employeeDidReceive(with dataStore: EmployeeDataStore)
//    func displayData()
    func showAlert()
}

protocol MainBusinessLogicProtocol: AnyObject {
//    func loadData()
}

protocol MainConfiguratorProtocol: AnyObject {
//    func configure(with viewController: EmployeeViewController)
}

protocol MainRouterProtocol: AnyObject {
// this protocol is not required for one screen app and may be removed.
}
