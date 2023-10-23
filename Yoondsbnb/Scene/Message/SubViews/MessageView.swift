//
//  MessageView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/23.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
		VStack(spacing: 0) {
			Text("메시지를 모두 읽으셨습니다.")
				.font(.headline)
			Text("호스트에게 연락하거나 예약 요청을 보내면, 이곳에 메시지가 표시됩니다.")
				.font(.subheadline)
				.foregroundColor(.gray)
		}
		
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
