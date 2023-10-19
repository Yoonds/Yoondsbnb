//
//  ContentView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/23.
//

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel = MainViewModel()
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
			
			GeometryReader { geometry in
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: geometry.size.width / 20) {
						// FIXME: 추후 서버에서 데이터 받아와서 해당 데이터 만큼 표시하기 (현재는 하드 코딩)
						VStack(spacing: geometry.size.height / 50) {
							Image(systemName: "house")
							Text("한옥")
						}
						VStack(spacing: geometry.size.height / 50) {
							Image(systemName: "globe.europe.africa")
							Text("기상천외한 숙소")
						}
						VStack(spacing: geometry.size.height / 50) {
							Image(systemName: "figure.skiing.downhill")
							Text("스키를 탄 채로 출입 가능")
						}
						VStack(spacing: geometry.size.height / 50) {
							Image(systemName: "bed.double")
							Text("개인 실")
						}
						VStack(spacing: geometry.size.height / 50) {
							Image(systemName: "slider.horizontal.3")
							Text("최고의 전망")
						}
						VStack(spacing: geometry.size.height / 50) {
							Image(systemName: "water.waves")
							Text("해변 바로 앞")
						}
					}
					.foregroundColor(.gray)
					.font(.subheadline)
					Divider()
				}
			}
			
			VStack {
				List(viewModel.datas) { data in
					VStack(spacing: 0) {
						Image(systemName: data.image)
							.resizable()
							.cornerRadius(15)
						HStack {
							VStack {
								Text(data.area)
								Text(data.description)
								Text(data.startDate + "~" + data.endDate)
							}
							Spacer()
							Text("\(data.grade)")
						}
					}
				}
				.listStyle(.plain)
			}
			
			TabView {
				Text("Search Tab")
					.tabItem {
						Image(systemName: "magnifyingglass")
						Text("검색")
					}
				Text("WishList Tab")
					.tabItem {
						Image(systemName: "heart")
						Text("위시리스트")
					}
				Text("Travel Tab")
					.tabItem {
						Image(systemName: "paperplane")
						Text("여행")
					}
				Text("Message Tab")
					.tabItem {
						Image(systemName: "message")
						Text("메시지")
					}
				Text("Profile Tab")
					.tabItem {
						Image(systemName: "person.crop.circle")
						Text("프로필")
					}
			}
		}
		.padding(.horizontal, 20)
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(viewModel: MainViewModel())
	}
}
