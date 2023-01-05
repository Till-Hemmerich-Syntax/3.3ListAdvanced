//
//  ContentView.swift
//  3.3 Test
//
//  Created by Lukas Altmann on 04.01.23.
//

import SwiftUI

let comment1 = Comment(text: "Du hast recht", author: "Ruben")
let comment2 = Comment(text: "Absolut", author: "Fahir")
let comment3 = Comment(text: "Endlich sagts mal einer", author: "Bekir")

let comment4 = Comment(text: "Definitv designen", author: "JP")
let comment5 = Comment(text: "Weiß ich noch nicht", author: "Bekir")

let comments1 = [comment1, comment2, comment3]
let comments2 = [comment4, comment5]


struct ContentView: View {
    
    @State var posts = [
        Post(title: "Ich liebe Apple!", author: "Peter", comments: comments1, showComments: false, date: "02.01.2023"),
        Post(title: "Macht euch designen oder programmieren mehr Spaß?", author: "Justus", comments: comments2, showComments: false, date: "03.01.2023")
    ]
    @State var showingSheet = false
    
    var body: some View {
        VStack {
            List (posts.indices, id: \.self){
                 index in
                    HStack {
                        PostView(post: posts[index])
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        for i in 0...posts.count-1 {
                            if (i == index) {
                                posts[i].showComments.toggle()
                            } else {
                                posts[i].showComments = false
                            }
                        }
                }
                if(posts[index].showComments){
                    Button("Add comment") {
                                showingSheet.toggle()
                            }
                }
                
                
            }
            
                    
        }
        .sheet(isPresented: $showingSheet) {
            Text("Test")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct PostView:View{
        var post: Post
        var body: some View {
            VStack(alignment: .leading) {
                if post.showComments {
                    VStack(alignment: .leading) {
                        /*@START_MENU_TOKEN@*/Text(post.title)/*@END_MENU_TOKEN@*/.fontWeight(.bold)
                        HStack {
                            Text(post.author).fontWeight(.bold)
                            Text(post.date)
                        }
                        
                    }
                    ForEach(post.comments) { comment in
                        VStack(alignment: .leading) {
                            Divider()
                            HStack {
                                Text("\(comment.author): \(comment.text)")
                            }
                        }
                    }
                    
                } else {
                    VStack(alignment: .leading) {
                        /*@START_MENU_TOKEN@*/Text(post.title)/*@END_MENU_TOKEN@*/
                        HStack {
                            Text(post.author).fontWeight(.bold)
                            Text(post.date)
                        }
                    }
                }
            }
        }
    }
}

