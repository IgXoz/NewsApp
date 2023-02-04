import UIKit

class MainViewController: UIViewController, MainDisplayLogicProtocol {
    
    // MARK: Properties:
    var presenter: MainPresentationLogicProtocol!
    private let configurator: MainConfiguratorProtocol = MainConfigurator()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
//    private var sectionViewModel: MainSectionViewModelProtocol = MainSectionViewModel()
    
    // MARK: Methods
//    func reloadData(for section: MainSectionViewModel) {
//        sectionViewModel = section
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "Check Internet Connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func setUpUI() {
        
        self.tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // MARK: LifeCycle Methods:
    override func loadView() {
        super.loadView()
//        setUpUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
//        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "EmployeeCell")
//        configurator.configure(with: self)
//        presenter.displayData()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpUI()
    }
}
    
// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       sectionViewModel.rows.count
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath)
//        cell.viewModel = cellViewModel
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
