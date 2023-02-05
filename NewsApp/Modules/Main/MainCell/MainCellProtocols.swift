import Foundation

// MARK: EmployeeCellViewModelProtocol
protocol MainCellViewModelProtocol {
    var cellIdentifier: String { get }
    var name: String { get }
//    var newsPhotoURL: String { get }
    
//    var author: String? { get }
//    var title: String { get }
//    var description: String { get }
//    var url: String { get }
//    var urlToImage: String? { get }
//    var publishedAt: Date { get }
//    var content: String { get }

//    init(article: Article)
    init(character: Character)
}

// MARK: EmployeeSectionViewModelProtocol
protocol MainSectionViewModelProtocol {
    var rows: [MainCellViewModelProtocol] { get }
}

// MARK: CellModelRepresentable
protocol CellModelRepresentable {
    var viewModel: MainCellViewModelProtocol? { get }
}
