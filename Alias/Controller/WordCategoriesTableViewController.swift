//
//  WordCategoriesTableViewController.swift
//  Alias
//
//  Created by ALEKSEY SUSLOV on 28.07.2022.
//

import UIKit

class WordCategoriesTableViewController: UITableViewController {
    
    let aliasWordsPack = AliasDataManager.shared.getAliasWordsCategories()

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aliasWordsPack.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordsPackTitleCell", for: indexPath)

        let wordsPackTitle = aliasWordsPack[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = wordsPackTitle.title
        
        cell.contentConfiguration = content

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aliasGameVC = segue.destination as? AliasGameViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let wordsPack = aliasWordsPack[indexPath.row]
        
        let aliasGameManager = AliasGameManager.getManagerWith(wordsPack)
        aliasGameVC.aliasGameManager = aliasGameManager
    }
}
