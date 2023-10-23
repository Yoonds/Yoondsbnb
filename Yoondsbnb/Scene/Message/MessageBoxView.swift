//
//  MessageBoxView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/19.
//

import SwiftUI

enum TabInfo: Int, CaseIterable, CustomStringConvertible {
	
	case message = 0
	case notification
	
	var description: String {
		switch self {
		case .message:
			return "메시지"
		case .notification:
			return "알림"
		}
	}
	
}

struct MessageBoxView: View {
	
	@State var currentTab: Int = 0
	
	@Namespace private var animation
	
	var tabInfo: TabInfo = .message
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("메시지함")
				.font(.largeTitle)
				.padding(.top, 40)
				.padding(.bottom, 25)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(Array(TabInfo.allCases.enumerated()), id: \.element) { index, itemName in
						tabbarItem(
							currentTab: $currentTab,
							nameSpace: animation,
							tabBarItemName: itemName.description,
							tab: index
						)
					}
				}
			}
			.padding(.top, 10)
			Divider()
			// TODO: 따로 빼지않고 Scrollview내부에 넣어서 사용하는 부분 고려하기
			TabView(selection: $currentTab) {
				MessageView().tag(0)
				NotificationView().tag(1)
			}
			.tabViewStyle(.page(indexDisplayMode: .never))
			Spacer()
		}
		.padding(.horizontal, 20)
    }
}

extension MessageBoxView {

	struct tabbarItem: View {
		
		@Binding var currentTab: Int
		
		let nameSpace: Namespace.ID
		let tabBarItemName: String
		let tab: Int
		
		var body: some View {
			Button {
				currentTab = tab
			} label: {
				VStack {
					Spacer()
					Text(tabBarItemName)
					if currentTab == tab {
						Color.black
							.frame(height: 2)
							.matchedGeometryEffect(
								id: "underLine",
								in: nameSpace,
								properties: .frame
							)
					} else {
						Color.clear.frame(height: 2)
					}
				}
				.animation(.spring(), value: currentTab)
			}
			.buttonStyle(.plain)
		}
	}
	
}

struct MessageBoxView_Previews: PreviewProvider {
    static var previews: some View {
		MessageBoxView()
    }
}
