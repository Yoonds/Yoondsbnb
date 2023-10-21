//
//  TravelView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/19.
//

import SwiftUI

struct TravelView: View {
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("여행")
				.font(.largeTitle)
				.padding(.top, 40)
				.padding(.bottom, 25)
			Divider()
				.padding(.bottom, 25)
			Text("아직 예약된 여행이 없습니다!")
				.font(.title2)
				.padding(.bottom, 20)
			Text("여행 가방에 쌓인 먼지를 털어내고 다음 여행 계획을 세워보세요.")
				.font(.subheadline)
				.padding(.bottom, 20)
			Button(action: {
				
			}, label: {
				Text("숙소 검색하기")
					.foregroundColor(.black)
					.padding(12)
			})
			.overlay {
				RoundedRectangle(cornerRadius: 10)
					.stroke(Color.black, lineWidth: 1)
			}
			.padding(.bottom, 20)
			Divider()
				.padding(.bottom, 20)
			HStack {
				Text("에약 내역을 찾으실 수 없나요?")
				Text("도움말 센터 방문하기")
					.underline(true)
			}
			.font(.system(size: 14))
			Spacer()
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.padding(.horizontal, 25)
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView()
    }
}
