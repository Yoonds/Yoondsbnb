//
//  WhishListView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/19.
//

import SwiftUI

struct WhishListView: View {
	
	@ObservedObject var viewModel = WhishListViewModel()
	
	@State private var columms: [GridItem] = .init(
		repeating: .init(.flexible(), spacing: 18.3),
		count: 2
	)
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			if !viewModel.whishListResponses.isEmpty {
				HStack {
					Spacer()
					Text(viewModel.isEditing ? "수정" : "완료")
						.font(.headline)
						.underline(true)
				}
			}
			VStack(alignment: .leading) {
				VStack(spacing: 0) {
					Text("위시리스트")
						.font(.largeTitle)
				}
				.padding(.bottom, 30)
				if viewModel.whishListResponses.isEmpty {
					VStack(alignment: .leading, spacing: 0) {
						Text("첫 번째 위시리스트 만들기")
							.font(.title2)
						Text("검색 중에 마음에 드는 숙소나 체험을 위시리스트에 저장하려면 하트 아이콘을 누르세요.")
							.foregroundColor(Color.gray)
					}
					.padding(.leading, 30)
					Spacer()
				} else {
					ScrollView(showsIndicators: false) {
						LazyVGrid(columns: columms, alignment: .center) {
							ForEach(viewModel.whishListResponses) { data in
								VStack(alignment: .leading) {
									Color.white
										.aspectRatio(1, contentMode: .fill)
										.cornerRadius(10)
										.overlay {
											Image(data.image)
												.resizable()
												.aspectRatio(1, contentMode: .fill)
												.cornerRadius(10)
												.padding(5)
										}
										.overlay(alignment: .topLeading) {
											if viewModel.isEditing {
												Image(systemName: "x.circle.fill")
													.resizable()
													.frame(width: 25, height: 25)
													.offset(x: 15, y: 15)
													.foregroundColor(.white)
											}
										}
										.shadow(
											color: .gray.opacity(0.4),
											radius: 10, x: 3, y: 3
										)
									Text("\(data.name)")
										.padding(.bottom, 0.5)
									Text("\(data.roomSaveCount)" + "개 저장됨")
										.font(.subheadline)
										.foregroundColor(.gray)
								}
							}
						}
					}
				}
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.padding(.horizontal, 25)
		.padding(.top, 50)
	}
}

struct WhishListView_Previews: PreviewProvider {
	static var previews: some View {
		WhishListView()
	}
}
