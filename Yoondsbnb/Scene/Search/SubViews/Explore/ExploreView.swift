//
//  ExploreView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct ExploreView: View {
	var body: some View {
		NavigationStack {
			SearchAndFilterBar()
			VStack {
				ScrollView(showsIndicators: false) {
					LazyVStack(spacing: 32) {
						ForEach( 0 ... 10, id: \.self) { listing in
							NavigationLink(value: listing) {
								ListingItem()
									.frame(height: 410)
									.clipShape(RoundedRectangle(cornerRadius: 10))
							}
						}
					}
				}
				.navigationDestination(for: Int.self) { listing in
					Text("detail view")
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
