//
// Created by Alex Jackson on 01/03/2021.
//

import Foundation

extension Post {
    static func loadAll(_ completion: @escaping (Result<[Post], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }

            do {
                let data = data ?? Data()
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    static func loadPost(withID postID: Int, completion: @escaping (Result<Post, Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postID)")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }

            do {
                let data = data ?? Data()
                let post = try JSONDecoder().decode(Post.self, from: data)
                completion(.success(post))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    
    
    
}
extension Comment{
    
    
    static  func getComments(forPost postID: Int, completion: @escaping ([Comment]?, Error?) -> Void) {
        let endpoint = "https://jsonplaceholder.typicode.com/posts/\(postID)/comments"
        let url = URL(string: endpoint)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            // Parse the data
            let jsonDecoder = JSONDecoder()
            do {
                let comments = try jsonDecoder.decode([Comment].self, from: data)
                completion(comments, nil)
                print(comments)
            } catch let decodingError {
                completion(nil, decodingError)
            }
        }
        task.resume()
    }
    
}
