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

    var newsHeader: String {
        article.title ?? "optional"
    }
//    var newsPhotoURL: String {
//        article.urlToImage ?? "123"
//    }
    
    private let article: Article
    
    required init(article: Article) {
        self.article = article
    }
    
}
