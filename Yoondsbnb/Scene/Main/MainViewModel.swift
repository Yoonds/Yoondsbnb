//
//  MainViewModel.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/24.
//

import Foundation

class MainViewModel: ObservableObject {
	
	// FIXME: 테스트를 위한 이미지 데이터 제거예정
	@Published var datas: [MainImageResponse] = [
		MainImageResponse(image: "mainTest", area: "서울", description: "산 정원", startDate: "11월 12일", endDate: "12월 17일", price: 150000, grade: 4.89),
		MainImageResponse(image: "mainTest", area: "서울", description: "산 정원", startDate: "11월 12일", endDate: "12월 17일", price: 150000, grade: 4.89),
		MainImageResponse(image: "mainTest", area: "서울", description: "산 정원", startDate: "11월 12일", endDate: "12월 17일", price: 150000, grade: 4.89)
	]
	
}
