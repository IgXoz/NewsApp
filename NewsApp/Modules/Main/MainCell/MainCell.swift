import UIKit

class MainCell: UITableViewCell {
    
    var viewModel: MainCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    static let identifier = "MainCell"
    private var qtyOfWatched = 0
    
    // MARK: SetupSubViews
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = Constants.viewBorderWidth
        return view
    }()
    
    private lazy var newsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Fonts.mediumBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.text = "header"
        return label
    }()
    
    private var imageNews: UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "blankImage") // delete!!!!!
        
        //            private func configureCell(cell: PersonageCell, for indexPath: IndexPath) {
        //                let personage = person[indexPath.row] // получили конкретный объект - персонаж
        //                cell.personageName.text = "Name: \(personage.name)"
        //                cell.personageSpecies.text = "Species: \(personage.species)"
        //
        //                // поработаем с загрузкой изображения
        //                DispatchQueue.global().async {
        //                    guard let imageUrl = URL(string: personage.image) else {return}
        //
        //                    //проверим, есть ли что-то по юрлу. присвоим данные экземпляру класса дата
        //                    guard let imageData = try? Data(contentsOf: imageUrl) else {return}
        //                    DispatchQueue.main.async {
        //                        cell.personageImage.image = UIImage(data: imageData)
        //                    }
        //                }
        //            }
        return image
    }
    
    
    private lazy var qtyOfWatchedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Fonts.mediumBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.text = "qtyOf"
        return label
    }()
    
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        addViews()
        setupView()
        
        //            setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        addViews()
        setupView()
        //        setupConstraints()
    }
    
    // MARK: Private Methods
    
    //    private func addViews() {
    //        contentView.addSubview(containerView)
    //        containerView.addSubview(imageNews)
    //        containerView.addSubview(newsHeaderLabel)
    //        containerView.addSubview(qtyOfWatchedLabel)
    //    }
    
    private func setupView() {
        
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellsSpacing)])
        
        containerView.addSubview(imageNews)
        NSLayoutConstraint.activate([
            imageNews.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.ImageConstants.imageLeading),
            //            imageNews.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.ImageConstants.imageTrailing),
            imageNews.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.ImageConstants.imageTop),
            imageNews.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.ImageConstants.imageBottom),
            imageNews.widthAnchor.constraint(equalToConstant: Constants.ImageConstants.imageWidth),
            imageNews.heightAnchor.constraint(equalToConstant: Constants.ImageConstants.imageHeight)])
        
        containerView.addSubview(newsHeaderLabel)
        NSLayoutConstraint.activate([
            newsHeaderLabel.leadingAnchor.constraint(equalTo: imageNews.trailingAnchor, constant: Constants.NewsHeaderConstants.newsHeaderLeading),
            newsHeaderLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.NewsHeaderConstants.newsHeaderTrailing),
            newsHeaderLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.NewsHeaderConstants.newsHeaderTop),
            newsHeaderLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.NewsHeaderConstants.newsHeaderBottom)])
        
        containerView.addSubview(qtyOfWatchedLabel)
        NSLayoutConstraint.activate([
            qtyOfWatchedLabel.leadingAnchor.constraint(equalTo: imageNews.trailingAnchor, constant: Constants.QtyOfWatchedConstants.qtyOfWatchedLeading),
            qtyOfWatchedLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.QtyOfWatchedConstants.qtyOfWatchedTrailing),
            qtyOfWatchedLabel.topAnchor.constraint(equalTo: newsHeaderLabel.bottomAnchor, constant: Constants.QtyOfWatchedConstants.qtyOfWatchedTop),
            qtyOfWatchedLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.QtyOfWatchedConstants.qtyOfWatchedBottom)])
    }
    
    
    private func updateView() {
        guard let viewModel = viewModel as? MainCellViewModel else { return }
        newsHeaderLabel.text = "123"
        qtyOfWatchedLabel.text = "Watched \(qtyOfWatched) times"
        
        //        nameLabel.text = viewModel.employeeName
        //        phoneNumberLabel.text = viewModel.employeePhoneNumber
        //        skillLabel.text = "Skills: \(viewModel.employeeSkill.joined(separator: ", "))"
    }
    
//    func configureCell() {
//        newsHeaderLabel.text = ""
//        qtyOfWatchedLabel.text = "Watched \(qtyOfWatched) times"
//    }
    
}

// MARK: Constants
enum Constants {
    
    fileprivate static let labelsSpacing: CGFloat = 5
    fileprivate static let cellsSpacing: CGFloat = 5
    fileprivate static let viewBorderWidth: CGFloat = 0.5
    
    enum ImageConstants {
        fileprivate static let imageHeight: CGFloat = 120
        fileprivate static let imageWidth: CGFloat = 120
        fileprivate static let imageLeading: CGFloat = 0
        fileprivate static let imageTrailing: CGFloat = 0
        fileprivate static let imageTop: CGFloat = 0
        fileprivate static let imageBottom: CGFloat = 0
    }
    
    enum NewsHeaderConstants {
        fileprivate static let newsHeaderLeading: CGFloat = 0
        fileprivate static let newsHeaderTrailing: CGFloat = 0
        fileprivate static let newsHeaderTop: CGFloat = 0
        fileprivate static let newsHeaderBottom: CGFloat = 0
    }
    
    enum QtyOfWatchedConstants {
        fileprivate static let qtyOfWatchedLeading: CGFloat = 0
        fileprivate static let qtyOfWatchedTrailing: CGFloat = 0
        fileprivate static let qtyOfWatchedTop: CGFloat = 0
        fileprivate static let qtyOfWatchedBottom: CGFloat = 0
    }
}





