//
//  CCategoryBottomSheetView.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import SwiftUI

struct CategoryBottomSheetView: View {
    let categories: [Category]
    @Binding var selectedCategoryBind: Category?
    
    var body: some View {
        VStack {
            Text("Select a Category")
                .font(.headline)
                .padding()
            
            List(categories) { category in
                Button(action: {
                    selectedCategoryBind = category
                }) {
                    HStack {
                        Text(category.name)
                            .font(.subheadline)
                            .padding(.vertical, 10)
                        
                        if selectedCategoryBind == category {
                            Spacer()
                            Image(systemName: ImageConstants.checkmarkIcon)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            Spacer()
        }
    }
}

//#Preview {
//    CategoryBottomSheet()
//}
