//
//  ContentView.swift
//  FakePosts
//
//  Created by Juan Catalan on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    private let service = PostsService()
    @State private var users: [User] = []
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: PostsView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.title3)
                        Label(user.email, systemImage: "envelope")
                        Label(user.phone, systemImage: "phone")
                    }
                    .font(.footnote)
                }
            }
            .navigationTitle("Users")
        }
        .listStyle(.plain)
        .task {
            users = await service.fetchUsers()
        }
    }
}

struct PostsView: View {
    private let service = PostsService()
    @State private var posts: [Post] = []
    let user: User
    
    var body: some View {
        List(posts) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title3)
                    .foregroundStyle(.blue)
                Divider()
                    .background(.blue)
                Text(post.body)
                    .font(.subheadline)
            }
        }
        .navigationTitle(user.name)
        .task {
            posts = await service.fetchPosts(user: user)
        }
    }
}

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
}

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct PostsService {
    private func fetch<T: Decodable>(type: T.Type, from urlString: String) async -> T? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            return nil
        }
    }
    
    func fetchUsers() async -> [User] {
        await fetch(type: [User].self,
                    from: "https://jsonplaceholder.typicode.com/users") ?? []
    }
    
    func fetchPosts(user: User) async -> [Post] {
        await fetch(type: [Post].self,
                    from: "https://jsonplaceholder.typicode.com/posts?userId=\(user.id)") ?? []
    }
}

#Preview {
    ContentView()
}
