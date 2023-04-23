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
						.padding(.horizontal, 20)
					MainTabView()
        }
    }
}

struct SearchBar: View {

	@State var serachText: String = ""
	
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
			VStack {
				TextField("어디로 여행가세요?", text: $serachText)
				Text("어디든지 언제든 일주일 게스트 추가")
			}
			Spacer()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
