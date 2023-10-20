//
//  MainImageResponse.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/18.
//

import Foundation

struct MainImageResponse: Identifiable, Hashable {
	
	var id = UUID()
	var image: String // FIXME: 이미지 배열로 받은 후 그리드 노출 필요
    var country: String
	var region: String
	var description: String
	var startDate: String // FIXME: Date 타입 변경 필요
	var endDate: String
	var price: Int
	var grade: Float
	
}
