//
//  ContentView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/23.
//

import SwiftUI

struct MainView: View {
	
	var body: some View {
		VStack {
			SearchBar()
				.padding(.bottom, 10)
			MainTopSlideBar()
			MainImageView()
			MainTabView()
		}
		.padding(.horizontal, 20)
	}
}

extension MainView {
	
	struct SearchBar: View {
		
		@State var serachText: String = ""
		@State var isSelectedSearchBar: Bool = false
		
		var body: some View {
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
		}
		
	}
	
	struct MainTopSlideBar: View {
		
		var body: some View {
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
				}
			}
		}
		
	}
	
	struct MainImageView: View {
		
		@State var mainViews: [Image] = []
		@State private var columns: [GridItem] = []// FIXME: 데이터 불러오기
		
		var body: some View {
			VStack {
				ScrollView(showsIndicators: false) {
					LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
						
					}
					Image("travel")
						.resizable()
						.cornerRadius(15)
						.overlay {
							Image(systemName: "heart")
								.padding(
									.init(
										top: 0,
										leading: 300,
										bottom: 100,
										trailing: 0
									)
								)
						}
					HStack {
						Text("밀라노, 이탈리아")
							.font(.headline)
						Spacer()
					}
					HStack {
						Text("호스트: Valentine 님 - 인테리어 디자이너")
						Spacer()
					}
					HStack {
						Text("7월 24일 - 29일")
						Spacer()
					}
				}
			}
		}
		
	}
	
	struct MainTabView: View {
		
		var body: some View {
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
		
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
