//
//  Comments.swift
//  3.3 Test
//
//  Created by Lukas Altmann on 04.01.23.
//

import Foundation

struct Comment: Identifiable {
    var id = UUID()
    var text: String
    var author: String
}

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var comments: Array<Comment>
    var showComments: Bool
    var date: String
}
