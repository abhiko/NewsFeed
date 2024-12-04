//
//  BookmarkManager.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 04/12/24.
//

import XCTest
@testable import NewsFeed

class BookmarkManagerTests: XCTestCase {
    
    var bookmarkManager: BookmarkManager!
    var mockStorage: MockUserDefaults!
    
    override func setUp() {
        super.setUp()
        
        // Create a mock UserDefaults for testing
        mockStorage = MockUserDefaults(suiteName: "testSuite")!
        
        // Clear mock storage before each test
        mockStorage.clear()
        
        // Override the default UserDefaults used by BookmarkManager
        UserDefaults.standard = mockStorage
        
        // Instantiate the BookmarkManager (using the original class with the injected mock storage)
        bookmarkManager = BookmarkManager()
    }
    
}
