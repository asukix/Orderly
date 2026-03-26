//
//  MenuViewController.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 21..
//
import UIKit
import Combine

class MenuViewController: UIViewController {
    private var viewModel: MenuViewModel
    let titleLabel = UILabel()
    let itemInfoTable = UITableView()
    private var cancellables = Set<AnyCancellable>()
    var onItemSelected: ((MenuItemModel) -> Void)?
    
    lazy var verticalPadding: CGFloat = {
        VCConstants.verticalPadding
    }()
    
    lazy var horizontalPadding: CGFloat = {
        VCConstants.horizontalPadding
    }()
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViewDefaults()
        setupSubscriptions()
    }
    
    private func setViewDefaults() {
        setTitleDefaults()
        setItemInfoTableDefaults()
    }
    
    private func setupSubscriptions() {
        viewModel.$items.receive(on: DispatchQueue.main)
            .sink { [weak self]  _ in
                self?.itemInfoTable.reloadData()
            }
            .store(in: &cancellables)
    }
}

// MARK: View setups
extension MenuViewController {
    private func setTitleDefaults() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding)
        ])
        
        titleLabel.text = "Menu"
        titleLabel.font = .preferredFont(forTextStyle: .headline)
    }
    
    private func setItemInfoTableDefaults() {
        view.addSubview(itemInfoTable)
        
        itemInfoTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemInfoTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: verticalPadding),
            itemInfoTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -verticalPadding),
            itemInfoTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalPadding),
            itemInfoTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalPadding)
        ])
        
        itemInfoTable.dataSource = self
        itemInfoTable.delegate = self
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.items[indexPath.row].name
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onItemSelected?(viewModel.items[indexPath.row])
    }
}
