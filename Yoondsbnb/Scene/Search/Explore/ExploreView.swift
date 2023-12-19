//
//  ExploreView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var isShowDestinationSearchView: Bool = false
    
    var body: some View {
        NavigationStack {
            if isShowDestinationSearchView {
                DestinationSearchView(isShow: $isShowDestinationSearchView)
            } else {
                ScrollView(showsIndicators: false) {
                    SearchAndFilterBar()
                        .padding(.horizontal)
                        .onTapGesture {
                            withAnimation(.linear) {
                                isShowDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        ForEach( 0 ... 10, id: \.self) { listing in
                            ListingItemView()
                                .frame(height: 410)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
