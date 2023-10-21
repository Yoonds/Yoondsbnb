//
//  WhishListData.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/21.
//

import Foundation

struct WhishListResponse: Identifiable {
	
	var id = UUID()
	var image: String
	var name: String
	var roomSaveCount: Int
	
}
