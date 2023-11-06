//
//  SearchAndFilterBar.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/04.
//

import SwiftUI

struct SearchAndFilterBar: View {
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
			
			VStack(alignment: .leading, spacing: 2) {
				Text("어디로 여행가세요?")
					.font(.footnote)
					.fontWeight(.semibold)
				
				Text("어디든지 언제든 일주일 게스트 추가")
					.font(.caption2)
					.foregroundColor(.gray)
			}
			
			Spacer()
			
			Button {
				print("")
			} label: {
				Image(systemName: "slider.horizontal.3")
					.foregroundStyle(.black)
			}
			.padding(8)
			.overlay {
				Circle()
					.stroke(lineWidth: 0.7)
					.foregroundColor(Color(.systemGray))
			}
			
		}
		.padding(.horizontal)
		.padding(.vertical, 10)
		.overlay {
			Capsule()
				.stroke(lineWidth: 0.5)
				.foregroundColor(Color(.systemGray4))
				.shadow(color: .black.opacity(0.5), radius: 2)
		}
	}
}

struct SearchAndFilterBar_Previews: PreviewProvider {
	static var previews: some View {
		SearchAndFilterBar()
	}
}
