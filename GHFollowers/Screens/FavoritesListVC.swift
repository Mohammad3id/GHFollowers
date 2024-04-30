//
//  FavoritesListViewController.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 06/04/2024.
//

import UIKit

class FavoritesListVC: GFDataLoadingVC {
    
    let tableView = UITableView()
    var favorites = [Follower]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getFavorites()
    }

    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseId)
    }

    
    func getFavorites() {
        do {
            let favorites = try PersistenceManager.retrieveFavorites()
            updateUI(with: favorites)
        } catch let error as GFError {
            presentGFAlert(title: "Somehting went wrong", message: error.rawValue, buttonTitle: "OK")
        } catch {
            presentDefaultError()
        }
    }
    
    
    func updateUI(with favorites: [Follower]) {
        if favorites.isEmpty {
            showEmptyStateView(with: "No Favorites?\nAdd one on the followers screen.", in: view)
        } else {
            self.favorites = favorites
            tableView.reloadData()
            view.bringSubviewToFront(self.tableView)
        }
    }
    
}


extension FavoritesListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseId, for: indexPath) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC = FollowerListVC(username: favorite.login)
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        do {
            try PersistenceManager.updateFavorites(with: favorites[indexPath.row], actionType: .remove)
            favorites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } catch let error as GFError {
            presentGFAlert(title: "Somehting went wrong", message: error.rawValue, buttonTitle: "OK")
        } catch {
            presentDefaultError()
        }
    }
    
}
