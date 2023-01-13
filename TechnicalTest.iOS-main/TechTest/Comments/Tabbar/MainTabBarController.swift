//
//  MainTabBarController.swift
//  TechTest
//
//  Created by WFX on 12/01/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    let offlinePostsVC = OfflinePostsViewController()
       let originalPostsVC = PostListViewController()
       var offlinePostCount = 0 {
           didSet {
               updateBadge()
           }
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [originalPostsVC, offlinePostsVC]
               updateBadge()

        // Do any additional setup after loading the view.
    }
    func updateBadge() {
            let offlineTab = tabBar.items![1]
            offlineTab.badgeValue = offlinePostCount > 0 ? "\(offlinePostCount)" : nil
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
