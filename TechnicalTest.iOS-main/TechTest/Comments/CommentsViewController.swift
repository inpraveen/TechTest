//
//  CommentsViewController.swift
//  TechTest
//
//  Created by WFX on 11/01/23.
//


import UIKit




class CommentsViewController: UITableViewController {
    
  
    private static let cellIdentifier = "CommentCell"

    
    
   
  
//    private var loadComment: Comment?
    var comments: [Comment] = []

//    private let interactor = PostListInteractor()
    private var displayedComment: [Comment] = []
    
    
//    var comment: [Comment] = []
    var postID: Int!
    @IBOutlet private(set) var activityIndicator: UIActivityIndicatorView!


//    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        tableView.backgroundColor = .white // set a color you need
        tableView.setEditing(true, animated: true)


        getCommentsData()
        
        // setup tableView
               tableView.delegate = self
               tableView.dataSource = self
//               tableView.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
//               view.addSubview(tableView)
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: Self.cellIdentifier)
        title = "All Comments"

//        overrideUserInterfaceStyle = .light
        tableView.backgroundColor = .white // set a color you need

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        

        // Do any additional setup after loading the view.
    }
    func getCommentsData()
    {
        Comment.getComments(forPost: postID) { comments, error in
            if let error = error {
                // handle the error
                print(error)
                return
            }
            guard let comments = comments else {
                // handle the case where no comments are returned
                return
            }
            // use the comments to update the UI or perform other actions
            self.comments = comments
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            // reload tableView or update UI
    }
        func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

            getCommentsData()


            
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        
        
      
        
    }
    
    // MARK: - Public Methods

  

    // MARK: - Table View Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]

         print(comment)
         cell.nameLabel.text = comment.name
//         cell.emailLabel.text = comment.email
         cell.bodyLabel.text = comment.body

        cell.configure(with: comment)
//        cell.accessoryType = .disclosureIndicator

        return cell
    }
 
   
}


// MARK: - UITableViewDelegate, UITableViewDataSource
//extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return comments.count
//    }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
//        let comment = comments[indexPath.row]
//        cell.nameLabel.text = comment.name
//        cell.emailLabel.text = comment.email
//
//        cell.configure(with: comment)
//        return cell
//    }
//}

