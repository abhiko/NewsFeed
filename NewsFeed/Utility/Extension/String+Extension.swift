//
//  String+Extension.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation

extension String {
    static func fromDate(_ date: Date, format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
