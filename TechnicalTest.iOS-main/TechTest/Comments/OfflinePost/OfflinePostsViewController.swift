//
//  OfflinePostsViewController.swift
//  TechTest
//
//  Created by WFX on 12/01/23.
//

import UIKit


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




class OfflinePostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var offlinePosts: [Post] = []
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // setup tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offlinePosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let post = offlinePosts[indexPath.row]
        cell.configure(with: post)

        return cell
    }
}
