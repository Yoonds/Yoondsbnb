//
//  ContentView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
					MainTabView()
        }
        .padding()
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
					Image(systemName: "magnifyingglass")
					Text("위시리스트")
				}
			Text("Travel Tab")
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("여행")
				}
			Text("Message Tab")
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("메시지")
				}
			Text("Profile Tab")
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("프로필")
				}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
