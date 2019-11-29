//
//  EmailViewModel.swift
//  SparkScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import Foundation

struct EmailViewModel {
    private let calendar = Calendar.current
    let email: Email
    
    var sender: String {
        return email.sender
    }
    
    var subject: String {
        return email.subject
    }
    
    var body: String {
        return email.body
    }
    
    var isRead: Bool {
        return email.isRead
    }
    
    var date: Date {
        return email.date
    }
    
    var dateFormated: String {
        if self.actualDateTime == "Today" {
            var hour = calendar.component(.hour, from: email.date)
            let minutes = calendar.component(.minute, from: email.date)
            var meridiemTime = "AM"
            let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
            
            switch hour {
            case 0...11:
                meridiemTime = "AM"
                break
            case 12...23:
                if hour > 12 {
                    hour += 12 - 24
                }
                meridiemTime = "PM"
                break
            case 24:
                hour = 0
                meridiemTime = "AM"
                break
            default:
                print("unmatched case")
            }
            return "\(hour):\(minutesString) \(meridiemTime)"
        } else if self.actualDateTime == "Yesterday" {
            return self.actualDateTime
        } else {
            let month = calendar.component(.month, from: email.date)
            return "\(calendar.shortMonthSymbols[month - 1]) \(calendar.component(.day, from: email.date))"
        }
        
        
    }
    
    
    
    var actualDateTime: String {
        let today = Date()
        let daysDifference = Int(self.email.date.timeIntervalSince1970 - today.timeIntervalSince1970) / 86400
        print(daysDifference)
        switch daysDifference {
        case 0:
            return "Today"
        case -1:
            return "Yesterday"
        case -7...(-2):
            return "Last 7 Days"
        default:
            let month = calendar.component(.month, from: self.email.date)
            return calendar.monthSymbols[month - 1]
        }
    }
    
}
