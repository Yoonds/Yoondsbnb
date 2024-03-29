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
	@State var isShowDestinationSearchView: Bool = false
    
    var body: some View {
        if isShowDestinationSearchView {
//            DestinationSearchView(show: $showDestinationSearchView)
        } else {
            VStack(spacing: 0) {
                ExploreView()
            }
            .preferredColorScheme(.light)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView(viewModel: SerachViewModel())
    }
}
