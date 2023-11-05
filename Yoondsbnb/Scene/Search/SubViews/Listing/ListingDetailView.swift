//
//  ListingDetailView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct ListingDetailView: View {
	
	var images = [
		"mainTest",
		"mainTest2",
		"mainTest3",
		"mainTest4"
	]
	
	var body: some View {
		ScrollView {
			ListingImageCarouselView()
			//				.frame(width: 320)
			
			VStack(alignment: .leading, spacing: 0) {
				Text("한국 서울")
					.font(.title)
					.fontWeight(.semibold)
					.padding(.bottom, 15)
				
				VStack(alignment: .leading) {
					HStack(spacing: 2) {
						Image(systemName: "star.fill")
						Text("4.86")
						Text(" - ")
						Text("후기 28개")
							.underline()
						Image(systemName: "person.fill.turn.down")
						Text("슈퍼호스트")
					}
					.foregroundColor(.black)
					
					HStack(spacing: 0) {
						Text("영곡면")
						Text(", ")
						Text("강릉시")
						Text(", ")
						Text("강원도")
						Text(", ")
						Text("한국")
					}
				}
				.font(.caption)
				.padding(.bottom, 15)
				
				HStack(spacing: 20) {
					Text("흔치 않은 기회입니다. 복선님의 에어비엔비 보통 예약이 가득 차 있습니다.")
						.font(.footnote)
					
					Spacer()
					
					Image(systemName: "diamond")
						.foregroundColor(.cyan)
				}
				.padding(.bottom, 15)
				
				Divider()
				
				HStack(spacing: 0) {
					Text("복선")
					Text(" 님이")
					Text(" 호스팅하는")
					Text(" B&b")
					Text("의 방")
					
					Spacer()
					
					Image("mainTest")
						.resizable()
						.scaledToFill()
						.frame(width: 64, height: 64)
						.clipShape(Circle())
						.overlay(alignment: .bottomTrailing) {
							Image(systemName: "person.fill.turn.down")
								.foregroundColor(.red)
						}
				}
				.padding(.vertical, 15)
				
				Divider()
					.padding(.bottom, 15)
				
				VStack(alignment: .leading, spacing: 15) {
					HStack(alignment: .top, spacing: 0) {
						Image(systemName: "person.fill.turn.down")
						
						VStack(spacing: 0) {
							Text("b&b의 방")
							Text("Aibiya님은 슈퍼호스트 입니다.")
						}
					}
					HStack(alignment: .top, spacing: 0) {
						Image(systemName: "person.fill.turn.down")
						
						VStack(spacing: 0) {
							Text("b&b의 방")
							Text("Aibiya님은 슈퍼호스트 입니다.")
						}
					}
					HStack(alignment: .top, spacing: 0) {
						Image(systemName: "person.fill.turn.down")
						
						VStack(spacing: 0) {
							Text("b&b의 방")
							Text("Aibiya님은 슈퍼호스트 입니다.")
						}
					}
				}
				
				Spacer()
			}
			.padding(.horizontal, 15)
		}
	}
}

struct ListingDetailView_Previews: PreviewProvider {
	static var previews: some View {
		ListingDetailView()
	}
}
