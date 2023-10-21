//
//  WhishListViewModel.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/21.
//

import Foundation

class WhishListViewModel: ObservableObject {
	
	@Published var isEditing: Bool = false
	@Published var whishListResponses: [WhishListResponse] = [
	WhishListResponse(image: "mainTest", name: "방 2023", roomSaveCount: 4),
	WhishListResponse(image: "mainTest", name: "방 2023", roomSaveCount: 4),
	WhishListResponse(image: "mainTest", name: "방 2023", roomSaveCount: 4)
	]
	
}

