//
//  MenuViewController.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 21..
//
import UIKit

class MenuViewController: UIViewController {
    private var viewModel: MenuViewModel
    let titleLabel = UILabel()
    
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
        
        setupTitleDefaults()
    }
}

// MARK: View setups
extension MenuViewController {
    private func setupTitleDefaults() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding).isActive = true
        titleLabel.text = "Menu"
        titleLabel.font = .preferredFont(forTextStyle: .headline)
    }
    
}
