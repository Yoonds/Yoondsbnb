//
//  DestinationSearchView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct DestinationSearchView: View {
	@Binding var show: Bool
	
    var body: some View {
		VStack {
			Text("어디로 여행가세요?")
		}
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
		DestinationSearchView(show: .constant(false))
    }
}
