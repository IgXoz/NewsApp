import Foundation

// Structure for loaded data. Структура для загружаемых данных.
struct MainDataStore {
    let characters: [Character]
}

class MainPresenter: MainPresentationLogicProtocol {
    
    // MARK: Properties:
    private var dataStore: MainDataStore?
    var router: MainRouterProtocol! // not required for one-screen app, can be removed.
    weak var view: MainDisplayLogicProtocol!
    var interactor: MainBusinessLogicProtocol!
    
    required init(view: MainDisplayLogicProtocol) {
        self.view = view
    }
    
    // MARK: Methods:
    func articleDidReceive(with dataStore: MainDataStore) {
                self.dataStore = dataStore
                let section = MainSectionViewModel()
        
        let characters = dataStore.characters
        characters.forEach {
            character in
            let cellViewModel = MainCellViewModel(character: character)
            section.rows.append(cellViewModel)
        }
        
//                let sortedEmployees = dataStore.employees.sorted(by: {$0.name < $1.name})
//                sortedEmployees.forEach { employee in
//                    let cellViewModel = EmployeeCellViewModel(employee: employee)
//                    section.rows.append(cellViewModel)
//                }
                view.reloadData(for: section)
    }
    
    func displayData() {
                interactor.loadData()
    }
    
    func showAlert() {
        DispatchQueue.main.async {
            self.view.presentAlert()
        }
    }
}
