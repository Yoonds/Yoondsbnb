//
//  ProfileListItem.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/24.
//

import SwiftUI

struct ProfileListItem: View {
	
	// TODO: 외부에서 주입할 경우 Kind로 구분하도록 변경
	enum ListItemKind: String, CustomStringConvertible {
		
		case privacy
		case payment
		
		var description: String {
			switch self {
			case .privacy:
				return("개안정보")
			case .payment:
				return("개안정보2")
			}
		}
	}
	
	let imageName: String
	let title: String
	let description: String?
	
	init(imageName: String, title: String, description: String? = nil) {
		self.imageName = imageName
		self.title = title
		self.description = description
	}
	
    var body: some View {
		Button {
			print("페이지 이동")
		} label: {
			VStack(spacing: 0) {
				HStack(spacing: 15) {
					Image(systemName: imageName)
					Text(title)
					Spacer()
					Image(systemName: "chevron.right")
				}
//				Text(description)
//				.font(.subheadline)
//				.foregroundColor(.gray)
				Divider()
					.padding(.vertical, 12)

			}
		}
		.buttonStyle(.plain)
    }
}

struct ProfileListItem_Previews: PreviewProvider {
    static var previews: some View {
		ProfileListItem(imageName: "", title: "")
    }
}
