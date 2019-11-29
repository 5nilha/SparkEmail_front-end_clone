//
//  EmailTableViewCell.swift
//  SparkScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class EmailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var circleView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.circleView.circle()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(emailViewModel: EmailViewModel) {
        
        self.senderLabel.text = emailViewModel.sender
        self.subjectLabel.text = emailViewModel.subject
        self.bodyLabel.text = emailViewModel.body
        self.dateLabel.text = emailViewModel.dateFormated
        
        if emailViewModel.isRead {
            self.circleView.isHidden = true
        } else {
            self.circleView.isHidden = false
        }
    }

}
