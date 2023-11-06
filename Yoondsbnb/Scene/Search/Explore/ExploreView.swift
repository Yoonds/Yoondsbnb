//
//  ExploreView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct ExploreView: View {
	var body: some View {
		//		NavigationStack {
		SearchAndFilterBar()
		VStack {
			ScrollView(showsIndicators: false) {
				LazyVStack(spacing: 32) {
					ForEach( 0 ... 10, id: \.self) { listing in
						ListingItem()
							.frame(height: 410)
							.clipShape(RoundedRectangle(cornerRadius: 10))
					}
				}
			}
			ListingDetailView()
		}
		//		}
	}
}

struct ExploreView_Previews: PreviewProvider {
	static var previews: some View {
		ExploreView()
	}
}
