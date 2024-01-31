//
//  ListingItemView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct ListingItemView: View {
	
	var body: some View {
		VStack(spacing: 8) {
            TabView {
                ForEach(0...3, id: \.self) { image in
                    Rectangle()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .tabViewStyle(.page)
			
			HStack(alignment: .top) {
				VStack(alignment: .leading) {
					Text("한국 서울")
						.fontWeight(.semibold)
						.foregroundColor(.black)
					Text("산 및 정원 전망")
						.foregroundStyle(.gray)
					Text("11월 12일~17일")
						.foregroundStyle(.gray)
					HStack(spacing: 4) {
						Text("₩"+String(159765.formatPrice()))
							.fontWeight(.semibold)
						Text("/박")
					}
				}
				
				Spacer()
				
				HStack(spacing: 2) {
					Image(systemName: "star.fill")
					Text("4.86")
				}
				.foregroundColor(.black)
			}
            .font(.footnote)
		}
        .padding(.horizontal)
	}
}

struct ListingItem_Previews: PreviewProvider {
	static var previews: some View {
		ListingItemView()
	}
}
