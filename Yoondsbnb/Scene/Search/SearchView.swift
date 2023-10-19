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
	@State var isSelectedSearchBar: Bool = false
	
	
	var body: some View {
		VStack {
			HStack {
				Image(systemName: "magnifyingglass")
				VStack(alignment: .leading, spacing: 0) {
					Text("어디로 여행가세요?")
					TextField("어디든지 언제든 일주일 게스트 추가", text: $serachText)
				}
				Image(systemName: "slider.horizontal.3")
					.padding(10)
					.overlay(
						Circle()
							.stroke(.gray)
					)
					.onTapGesture {
						print("필터 클릭")
					}
			}
			.font(.headline)
			.padding(10)
			.background(
				RoundedRectangle(cornerSize: CGSize(width: 30.0, height: 30.0))
					.fill(Color.white)
					.shadow(
						color: .gray.opacity(0.3),
						radius: 15, x: 0, y: 0
					)
			)
			.padding(.bottom, 10)
			
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHGrid(rows: [GridItem(.flexible(minimum: 5))], spacing: 10) {
					ForEach(viewModel.mainSlideDatas) { data in
						VStack(spacing: 0) {
							Image(systemName: data.iconName)
							Text(data.travelTitle)
								.font(.system(size: 12))
						}
					}
				}
			}
			
			Spacer()
			
			VStack {
				List(viewModel.mainImageDatas) { data in
					VStack(spacing: 0) {
						Image(data.image)
							.resizable()
							.cornerRadius(15)
						HStack {
							VStack {
								Text(data.area)
								Text(data.description)
								Text(data.startDate + "~" + data.endDate)
							}
							Spacer()
							VStack {
								Text("\(data.grade)")
								Spacer()
							}
						}
					}
				}
				.listStyle(.plain)
//				.listRowInsets(EdgeInsets())
			}
		}
		.preferredColorScheme(.light)
		.navigationBarTitleDisplayMode(.inline)
		.padding(.horizontal, 10)
		
	}
}

//struct ContentView_Previews: PreviewProvider {
//	static var previews: some View {
//		SearchView(viewModel: SerachViewModel())
//	}
//}
