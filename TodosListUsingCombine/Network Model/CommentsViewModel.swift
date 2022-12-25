//
//  CommentsViewModel.swift
//  TodosListUsingCombine
//
//  Created by Kiran Sonne on 05/04/22.
//

import Foundation
struct Comments: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
