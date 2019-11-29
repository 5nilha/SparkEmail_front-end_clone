//
//  DataServices.swift
//  SparkScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import Foundation

class DataServices {
    static func loadEmails(completion: @escaping ([Email]) -> Void) {
        let emails = [
            Email(sender: "SubjectTest@test.com", subject: "Email Test", body: "This is an email test", isRead: false, date: Date()),
            Email(sender: "auto_confirm@amaozn.com", subject: "Your Amazon order of Vitamin C is on the way.", body: "Your Order No. 27eg23ghh2 was shipped and is scheduled to be deliveres on Monday, December 02 until 8PM. ", isRead: false, date: Date(timeIntervalSinceNow: -500.0)),
            Email(sender: "SubjectTest@test.com", subject: "Email Test", body: "This is an email test", isRead: false, date: Date(timeIntervalSinceNow: -190600.0)),
            Email(sender: "SubjectTest@test.com", subject: "Email Test 2", body: "This is an email test", isRead: false, date: Date(timeIntervalSinceNow: -7976000.0)),
            Email(sender: "yesterdayEmail@test.com", subject: "Email yesterday", body: "This is an email from yesterday", isRead: false, date: Date(timeIntervalSinceNow: -90600.0))
                    ]
        completion(emails)
    }
    
}
