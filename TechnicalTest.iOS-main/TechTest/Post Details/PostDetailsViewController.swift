//
// Created by Alex Jackson on 01/03/2021.
//

import Foundation
import UIKit

final class PostDetailsViewController: UIViewController {

    // MARK: - Properties
//    let commentsButton = UIButton()
    var postID: Int!
    private var loadedPost: Post?

    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var bodyLabel: UILabel!
    @IBOutlet private(set) var commentsButton: UIButton!
    @IBOutlet private(set) var offlineSaveButton: UIButton!


    @IBOutlet private(set) var activityIndicator: UIActivityIndicatorView!
    
    
//    let offlineSaveButton = UIButton()
     var isPostSaved: Bool = false

    // MARK: - UIViewController Overrides

    override func viewDidLoad() {
            super.viewDidLoad()

            // configure the comments button
            commentsButton.setTitle("Comments", for: .normal)
            commentsButton.setTitleColor(.systemRed, for: .normal)
            commentsButton.addTarget(self, action: #selector(showComments), for: .touchUpInside)
            view.addSubview(commentsButton)
        
        // configure the offlineSaveButton
                offlineSaveButton.setTitle("Save for offline", for: .normal)
                offlineSaveButton.setTitleColor(.systemBlue, for: .normal)
                offlineSaveButton.addTarget(self, action: #selector(savePostForOffline), for: .touchUpInside)
                updateButtonTitle()
                view.addSubview(offlineSaveButton)
        
        
        }
    @objc func savePostForOffline() {
            isPostSaved = !isPostSaved
        
        savePostOffline(self.loadedPost!)
        
            updateButtonTitle()
            // Save the post in the local storage
        }
    func savePostOffline(_ post: Post) {
        var offlinePosts = getOfflinePosts()
        offlinePosts.append(post)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(offlinePosts) {
            UserDefaults.standard.set(encoded, forKey: "offlinePosts")
        }
    }
    
    func getOfflinePosts() -> [Post] {
        if let savedData = UserDefaults.standard.data(forKey: "offlinePosts"),
            let offlinePosts = try? JSONDecoder().decode([Post].self, from: savedData) {
            return offlinePosts
        }
        return []
    }
    func updateButtonTitle() {
            if isPostSaved {
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // configure the comments button
        commentsButton.setTitle("Comments", for: .normal)
        commentsButton.setTitleColor(.systemBlue, for: .normal)
    
        commentsButton.addTarget(self, action: #selector(showComments), for: .touchUpInside)
        view.addSubview(commentsButton)
       
        

        if loadedPost == nil {
            activityIndicator.startAnimating()
            title = "Loading…"

            Post.loadPost(withID: postID) { [weak self] result in
                DispatchQueue.main.async { [self] in
                    switch result {
                    case .success(let post):
                        self?.loadedPost = post
                        self?.title = post.title
                        self?.titleLabel.text = post.title
                        self?.bodyLabel.text = post.body
                        
                       
                    case .failure:
                        break
                    }

                    self?.activityIndicator.stopAnimating()
                    
                    
                }
            }
        }
    }


    @objc func showComments() {
        // create the comments view controller
        let commentsViewController = CommentsViewController()
        // configure it with the post's comments
        // push it onto the navigation stack
        commentsViewController.postID = postID

        navigationController?.pushViewController(commentsViewController, animated: true)
    }
    
    
}



