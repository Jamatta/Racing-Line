//
//  CircuitViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit
import SwiftUI

final class CircuitViewController: UIViewController, UITableViewDelegate {
    
    //MARK: - Properties
    private var viewModel: CircuitViewModel = CircuitViewModel(networkManager: Network())
    private var circuit = [Circuit]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(AppColors.background)
        setupViewModelDelegate()
        
        view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "raceCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewDidLoad()
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

//MARK: - Extension
extension CircuitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circuit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let circuit = circuit[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "raceCell", for: indexPath)
        
        cell.contentConfiguration = UIHostingConfiguration(content: {
            CircuitTableCellView(circuit: circuit)
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let circuitName = circuit[indexPath.row].circuitName
        let vc = UIHostingController(rootView: CircuitDetailViewController(circuitName: circuitName))
        navigationController?.present(vc, animated: true)
    }
}

extension CircuitViewController: CircuitViewModelDelegate {
    func circuitInfoGot(_ data: MRData) {
        
        guard let circuitData = data.circuitTable?.circuits else {
            return
        }
        circuit = circuitData
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("error!")
    }
}
