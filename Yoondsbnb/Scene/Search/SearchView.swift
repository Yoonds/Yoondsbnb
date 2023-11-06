//
//  SearchView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SerachViewModel()
    
    @State var serachText: String = ""
	@State var showDestinationSearchView: Bool = false
	
    var body: some View {
			if showDestinationSearchView {
				DestinationSearchView(show: $showDestinationSearchView)
			} else {
				VStack(spacing: 0) {
					ExploreView()
				}
				.preferredColorScheme(.light)
				.navigationBarTitleDisplayMode(.inline)
				.padding(.horizontal, 25)
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView(viewModel: SerachViewModel())
    }
}
