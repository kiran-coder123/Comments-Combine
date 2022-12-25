//
//  ViewController+TableView.swift
//  TodosListUsingCombine
//
//  Created by Kiran Sonne on 05/04/22.
//

import Foundation
import UIKit
 
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath)
        let comments = todoList[indexPath.row]
        cell.textLabel?.text = comments.name
        
        return cell
    }
    
    
}
