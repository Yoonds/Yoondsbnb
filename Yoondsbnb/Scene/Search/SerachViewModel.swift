//
//  SerachViewModel.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/24.
//

import Foundation

class SerachViewModel: ObservableObject {
	
	// FIXME: 하드 코딩 후 랜덤하게 노출 필요
	@Published var mainSlideDatas: [MainTopSlideData] = [
		MainTopSlideData(travelTitle: "최고의 전망", iconName: "house"),
		MainTopSlideData(travelTitle: "최고의 전망", iconName: "globe.europe.africa"),
		MainTopSlideData(travelTitle: "최고의 전망", iconName: "figure.skiing.downhill"),
		MainTopSlideData(travelTitle: "최고의 전망", iconName: "bed.double"),
		MainTopSlideData(travelTitle: "최고의 전망", iconName: "slider.horizontal.3")
	]
	
	// FIXME: 테스트를 위한 이미지 데이터 제거예정
	@Published var mainImageDatas: [MainImageResponse] = [
		MainImageResponse(image: "mainTest", area: "서울", description: "산 정원", startDate: "11월 12일", endDate: "12월 17일", price: 150000, grade: 4.89),
		MainImageResponse(image: "mainTest", area: "서울", description: "산 정원", startDate: "11월 12일", endDate: "12월 17일", price: 150000, grade: 4.89),
		MainImageResponse(image: "mainTest", area: "서울", description: "산 정원", startDate: "11월 12일", endDate: "12월 17일", price: 150000, grade: 4.89)
	]
	
}
