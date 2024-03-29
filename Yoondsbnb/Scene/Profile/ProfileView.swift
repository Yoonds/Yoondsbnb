//
//  ProfileView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/10/19.
//

import SwiftUI

struct ProfileView: View {
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 0) {
				HStack(spacing: 0) {
					Text("프로필")
						.font(.largeTitle)
					Spacer()
					Button {
						print("벨버튼")
					} label: {
						Image(systemName: "bell")
							.font(.system(size: 23))
					}
					.foregroundColor(.black)
				}
				.padding(.bottom, 20)
				
				HStack(spacing: 0) {
					Image("mainTest")
						.resizable()
						.frame(width: 70)
						.clipShape(Circle())
					VStack(alignment: .leading, spacing: 0) {
						Text("대성")
							.font(.title2)
						Text("프로필 보기")
							.font(.subheadline)
							.foregroundColor(.gray)
					}
					.padding(.leading, 20)
					Spacer()
					Image(systemName: "chevron.right")
						.font(.system(size: 20))
				}
				.padding(.bottom, 20)
				.frame(height: 80) // TODO: Geommtery 사용해서 크기 변경하는 부분 고민
				
				Divider()
					.padding(.vertical, 20)
				
				Spacer()
				
				Button {
					print("클릭")
				} label: {
					HStack {
						VStack(alignment: .leading, spacing: 0) {
							Text("당신의 공간을 에어비앤비하세요")
								.font(.title3)
								.padding(.bottom, 10)
							Text("간단히 숙소를 등록하고 수입을\n올릴 수 있어요.")
								.font(.subheadline)
								.foregroundColor(.gray)
						}
						Spacer()
						Image("mainTest")
							.resizable()
							.frame(width: 100, height: 100)
					}
					.padding(30)
				}
				.buttonStyle(.plain)
				.background(
					RoundedRectangle(cornerRadius: 15)
						.fill(Color.white)
				)
				.shadow(
					color: .gray.opacity(0.3),
					radius: 10, x: 3, y: 3
				)
				
				VStack(spacing: 0) {
					VStack(alignment: .leading, spacing: 0) {
						Text("환경설정")
							.font(.title2)
							.padding(.vertical, 30)
						ProfileListItem(imageName: "person.crop.circle", title: "개인 정보")
						ProfileListItem(imageName: "creditcard", title: "결제 및 대금 수령")
						ProfileListItem(imageName: "doc", title: "세금")
						ProfileListItem(imageName: "shield", title: "로그인 및 보안")
						ProfileListItem(imageName: "person.2.circle", title: "접근성")
						ProfileListItem(imageName: "character.bubble", title: "번역")
						ProfileListItem(imageName: "bell", title: "알림")
						ProfileListItem(imageName: "lock", title: "개인정보 보호 및 공유")
					}
					VStack(alignment: .leading, spacing: 0) {
						Text("호스팅")
							.font(.title2)
							.padding(.vertical, 30)
						ProfileListItem(imageName: "arrow.triangle.swap", title: "호스트 모드로 전환")
						ProfileListItem(imageName: "house", title: "숙소 등록하기")
						ProfileListItem(imageName: "book.closed", title: "가이드북")
					}
					VStack(alignment: .leading, spacing: 0) {
						Text("추천 및 여행 크레딧")
							.font(.title2)
							.padding(.vertical, 30)
						ProfileListItem(imageName: "giftcard", title: "호스트 초대하기")
						Text("호스트로 새로 추천할 때마다 ₩20.242의 크레딧을 받으세요.")
					}
					VStack(alignment: .leading, spacing: 0) {
						Text("도구")
							.font(.title2)
							.padding(.vertical, 30)
						ProfileListItem(imageName: "globe", title: "시리 설정")
					}
					VStack(alignment: .leading, spacing: 0) {
						Text("에어비앤비 지원")
							.font(.title2)
							.padding(.vertical, 30)
						ProfileListItem(imageName: "questionmark.circle", title: "도움말 센터 방문하기")
						ProfileListItem(imageName: "checkmark.shield", title: "안전 문제 관련 도움받기")
						ProfileListItem(imageName: "beats.headphones", title: "이웃 민원 신고")
						ProfileListItem(imageName: "person.fill.questionmark", title: "에어비앤비 이용 방법")
						ProfileListItem(imageName: "pencil", title: "피드백 남기기")
					}
					VStack(alignment: .leading, spacing: 0) {
						Text("법률")
							.font(.title2)
							.padding(.vertical, 30)
						ProfileListItem(imageName: "doc.plaintext", title: "이용 약관")
						ProfileListItem(imageName: "doc.plaintext", title: "개인정보 처리방침")
						ProfileListItem(imageName: "doc.plaintext", title: "오픈 소스 라이선스")
						ProfileListItem(imageName: "doc.plaintext", title: "회사 세부정보")
					}
				}
				Text("로그아웃")
					.underline()
					.padding(.vertical, 40)
				Text("버전 23.43.1")
					.font(.footnote)
					.foregroundColor(.gray)
			}
			.padding(
				EdgeInsets(
					top: 35,
					leading: 25,
					bottom: 35,
					trailing: 25
				)
			)
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
