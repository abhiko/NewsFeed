//
//  Category.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 03/12/24.
//

import Foundation

struct Category: Identifiable, Equatable {
    let id: UUID
    let name: CategoryEnum.RawValue
}


enum CategoryEnum: String{
    case technology = "Technology"
    case science = "Science"
    case business = "Business"
    case health = "Health"
    case sports = "Sports"
    case entertainment = "Entertainment"
}
