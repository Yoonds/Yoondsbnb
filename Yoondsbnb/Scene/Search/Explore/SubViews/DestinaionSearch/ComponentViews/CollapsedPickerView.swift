//
//  CollapsedPickerView.swift
//  Yoondsbnb
//
//  Created by Yoon Daesung on 1/23/24.
//

import SwiftUI

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .foregroundColor(Color.gray)
            Spacer()
            Text(description)
        }
        .font(.subheadline)
        .padding(25)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
    
}

#Preview {
    CollapsedPickerView(title: "", description: "")
}
