//
//  ListTVC.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit

final class MainVC: UITableViewController, LoadableAlertController, UISearchControllerDelegate {
    
    private let viewModel = MainViewModel()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarisEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarisEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupSearchBar()
        setupTableView()
        getDataHandler()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.isActive = false
    }
    
    private func setupTableView() {
        tableView.register(MainVCCell.self, forCellReuseIdentifier: MainVCCell.identifier)
        if viewModel.citiesArray.isEmpty {
            viewModel.citiesArray = Array(repeating: viewModel.newCity, count: viewModel.citiesNameArray.count)
        }
    }
    
    // MARK: - Search bar setup
    
    private func setupSearchBar() {
        searchController.searchBar.placeholder = Constants.MainVCConstants.searchBarPlaceholder
        searchController.searchBar.backgroundColor = .white
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - Navigation bar setup
    
    private func setupNavBar() {
        title = Constants.MainVCConstants.vcTitle
        let closeButton = UIBarButtonItem(
            title: Constants.MainVCConstants.backButtonTitle,
            style: .done,
            target: self, action: #selector(onCloseButtonTapped)
        )
        closeButton.tintColor = .white
        closeButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.cancelButtonFont], for: .normal)
        navigationItem.leftBarButtonItem = closeButton
        let rightBarButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(onAddNewCityTapped(_:))
        )
        rightBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc private func onCloseButtonTapped() {
        exit(0)
    }
    
    @objc private func onAddNewCityTapped(_ sender: UIBarButtonItem) {
        addNewCityAlert(name: Constants.MainVCConstants.alertTitle, placeholder: Constants.MainVCConstants.tfPlaceholder) { [weak self] city in
            if !city.isEmpty {
                guard let newCity = self?.viewModel.newCity else { return }
                self?.viewModel.citiesNameArray.append(city)
                self?.viewModel.citiesArray.append(newCity)
                self?.getDataHandler()
            } else {
                self?.presentAlertController()
            }
        }
    }
    
    private func getDataHandler() {
        viewModel.getData { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func showNextVC(for indexPath: IndexPath, isFiltering: Bool) {
        let item: Weather
        if isFiltering {
            item = viewModel.filteredCitiesArray[indexPath.row]
        } else {
            item = viewModel.citiesArray[indexPath.row]
        }
        let destVC = DetailsVC()
        destVC.weatherModel = item
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return viewModel.filteredCitiesArray.count
        }
        return viewModel.citiesArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.MainVCConstants.cellRowHeight
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = viewModel.citiesArray[indexPath.row]
        var city: Weather
        if isFiltering {
            city = viewModel.filteredCitiesArray[indexPath.row]
            (cell as? MainVCCell)?.configure(weather: city)
        } else {
            (cell as? MainVCCell)?.configure(weather: item)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: MainVCCell.identifier, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: Constants.MainVCConstants.deleteTitle) { [self] (_, _, completionHandler) in
            viewModel.deleteCity(for: indexPath, isFiltering: isFiltering)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        showNextVC(for: indexPath, isFiltering: isFiltering)
    }
    
}

// MARK:- UISearchResultsUpdating

extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        viewModel.filteredCitiesArray = viewModel.citiesArray.filter {
            $0.name.contains(searchText)
        }
        tableView.reloadData()
    }
}
