//
//  YoondsbnbApp.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/23.
//
	
import SwiftUI

@main
struct YoondsbnbApp: App {
    var body: some Scene {
        WindowGroup {
			TabView {
				SearchView()
					.tabItem {
						Label("검색", systemImage: "magnifyingglass")
					}
				WhishListView()
					.tabItem {
						Label("위시리스트", systemImage: "heart")
					}
				TravelView()
					.tabItem {
						Label("여행", systemImage: "paperplane")
					}
				MessageView()
					.tabItem {
						Label("메시지", systemImage: "message")
					}
				ProfileView()
					.tabItem {
						Label("프로필", systemImage: "person.crop.circle")
					}
			}
			.accentColor(.red)
        }
    }
}
