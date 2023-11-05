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
//					SearchAndFilterBar()
//						.onTapGesture {
//							withAnimation {
//								showDestinationSearchView.toggle()
//							}
//						}
//					ScrollView(.horizontal, showsIndicators: true) {
//						LazyHGrid(rows: [GridItem(.flexible(minimum: 5))], alignment: .bottom, spacing: 10) {
//							ForEach(viewModel.mainSlideDatas) { data in
//								VStack(alignment: .center, spacing: 3) {
//									Image(systemName: data.iconName)
//										.frame(height: 400)
//									Text(data.travelTitle)
//										.font(.system(size: 13))
//								}
//							}
//						}
//						.frame(height: 40)
//					}
//					.padding(.bottom, 10)
//					Rectangle()
//						.frame(height: 2)
//					Divider()
//						.padding(.top, 2)
//						.padding(.bottom, 10)
//					Spacer()
					
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
