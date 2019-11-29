//
//  EmailListViewModel.swift
//  SparkScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import Foundation

class EmailListViewModel {
    
    var emails = [String : [EmailViewModel]]()
    var sections = [String]()
    
    init(emails: [EmailViewModel]) {
        let sortedEmails = emails.sorted(by: { (a, b) -> Bool in
            return b.date < a.date
        })
        
        var currentDateTime = sortedEmails[0].actualDateTime
        self.sections.append(currentDateTime)
        var sectionEmails = [EmailViewModel]()
        
        for email in sortedEmails {
           
            if email.actualDateTime != currentDateTime {
                currentDateTime = email.actualDateTime
                sectionEmails.removeAll()
                sectionEmails.append(email)
                self.emails[email.actualDateTime] = sectionEmails
                self.sections.append(email.actualDateTime)
            } else {
                sectionEmails.append(email)
                self.emails[email.actualDateTime] = sectionEmails
            }
        }

    }
    
    var numberOfSections: Int {
        return self.sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        let section = emails[sections[section]]
        return section == nil ? 0 : section!.count
    }
    
    func getEmail(section: Int, row: Int) -> EmailViewModel? {
        let sectionEmails = emails[sections[section]]
        let email = sectionEmails?[row]
        return email
    }
}
