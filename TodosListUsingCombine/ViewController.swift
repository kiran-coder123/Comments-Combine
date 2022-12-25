//
//  ViewController.swift
//  TodosListUsingCombine
//
//  Created by Kiran Sonne on 05/04/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var todoListTableView: UITableView!
    
    
    private var commenntsUrl = URL(string: "https://jsonplaceholder.typicode.com/comments")
    private var cancellable: AnyCancellable?
    
    var todoList: [Comments] = [] {
        didSet {
            DispatchQueue.main.async {
                self.todoListTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getTodoListResponse()
        self.todoListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "commentsCell")
    }

    //MARK: Network request
    private func getTodoListResponse() {
        self.cancellable = URLSession.shared.dataTaskPublisher(for: commenntsUrl!)
            .map({$0.data})
            .decode(type: [Comments].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .assign(to: \.todoList, on: self)
    }
}

