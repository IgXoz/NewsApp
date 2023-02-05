import Foundation

// MARK: EmployeeSectionViewModel
class MainSectionViewModel: MainSectionViewModelProtocol {
    var rows: [MainCellViewModelProtocol] = []
}

// MARK: EmployeeCellViewModel
class MainCellViewModel: MainCellViewModelProtocol {
    
    var cellIdentifier: String {
        "MainCell"
    }

    var name: String {
        character.name
    }
//    var newsPhotoURL: String {
//        article.urlToImage ?? "123"
//    }
    
    private let character: Character
    
    required init(character: Character) {
        self.character = character
    }
    
}
