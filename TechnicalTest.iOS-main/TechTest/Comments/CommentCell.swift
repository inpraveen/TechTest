//
//  CommentCell.swift
//  TechTest
//
//  Created by WFX on 11/01/23.
//

import UIKit
import Foundation

final class CommentCell: UITableViewCell {
   
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var bodyLabel: UILabel!
    @IBOutlet private(set) var emailLabel: UILabel!
    @IBOutlet private(set) var idLabel: UILabel!
    
    

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//           super.init(style: style, reuseIdentifier: reuseIdentifier)
//           setupUI()
//       }
//    
//    required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
       func configure(with comment: Comment) {
           nameLabel.text = comment.name
//           emailLabel.text = comment.email
//           idLabel.text = comment.id
           bodyLabel.text = comment.body
       }
       
//       // setup UI related work
//       private func setupUI() {
//           //Add author and body label to the contentView
//       }
//    
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
