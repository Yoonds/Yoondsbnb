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
	
	@State var isPresentedSeeMoreBottomSheet: Bool = false
	
	var body: some View {
		ScrollView(showsIndicators: false) {
//			ListingImageCarouselView()
			VStack(alignment: .leading, spacing: 0) {
				VStack(alignment: .leading, spacing: 0) {
					Text("한국 서울")
						.font(.title)
						.fontWeight(.semibold)
						.padding(.bottom, 12)
					
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
					.padding(.bottom, 12)
					
					HStack(spacing: 20) {
						Text("흔치 않은 기회입니다. 복선님의 에어비엔비 보통 예약이 가득 차 있습니다.")
							.font(.footnote)
						
						Spacer()
						
						Image(systemName: "diamond")
							.foregroundColor(.cyan)
					}
					.padding(.bottom, 12)
					
					Divider()
						.padding(.bottom, 12)
				}
				
				VStack(alignment: .leading, spacing: 0) {
					HStack(spacing: 0) {
						VStack(alignment: .leading, spacing: 5) {
							HStack(alignment: .top, spacing: 0) {
								Text("복선")
								Text(" 님이")
								Text(" 호스팅하는")
								Text(" B&b")
								Text("의 방")
							}
//							.fontWeight(.semibold)
							
							VStack(alignment: .leading, spacing: 0) {
								HStack(spacing: 0) {
									Text("최대 인원 6명")
									Text("-")
									Text("침실 2개")
									Text("-")
									Text("침대 2개")
								}
								Text("욕실 1개")
							}
							.font(.footnote)
							
						}
						
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
					.padding(.bottom, 12)
					
					Divider()
						.padding(.bottom, 12)
				}
				
				VStack(alignment: .leading, spacing: 0) {
					ForEach(0..<3) { feature in
						HStack(alignment: .top, spacing: 12) {
							Image(systemName: "person.fill.turn.down")
							VStack(alignment: .leading, spacing: 0) {
								Text("b&b의 방")
								Text("Aibiya님은 슈퍼호스트 입니다.")
									.font(.caption)
									.foregroundColor(.gray)
							}
						}
					}
					.padding(.bottom, 12)
					
					Divider()
						.padding(.bottom, 20)
				}
				
				VStack {
					Button {
						print("클릭")
					} label: {
						HStack {
							VStack(alignment: .leading, spacing: 0) {
								Text("일부 정보는 원어로 표시됩니다.")
									.font(.caption)
								Text("번역")
									.font(.caption)
									.underline()
							}
							Spacer()
						}
						.padding(15)
					}
					.buttonStyle(.plain)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.fill(.gray)
					)
					.padding(.bottom, 20)
					
					VStack(alignment: .leading, spacing: 12) {
						Text("(서울=연합뉴스) 계승현 기자 = 특수강도 혐의로 서울구치소에 수감됐다가 병원 치료 중 달아난 김길수(36)가 6일 검거됐다. 수사당국에 따르면 경찰은 도주 사흘째인 이날 오후 경기도 의정부에서 김씨를 검거했다.앞서 김씨는 지난 4일 오전 6시 20분께 경기도 안양시 동안구 한림대학교 성심병원에서 진료받던 중 자신을 감시하던 교정당국 관계자들에게 화장실을 사용하겠다")
							.font(.footnote)
						Button {
							isPresentedSeeMoreBottomSheet.toggle()
						} label: {
							HStack(spacing: 3) {
								Text("더 보기")
									.font(.footnote)
									.fontWeight(.semibold)
									.underline()
								Image(systemName: "chevron.right")
									.font(.footnote)
							}
						}
						.buttonStyle(.plain)
						.sheet(isPresented: $isPresentedSeeMoreBottomSheet) {
							SeeMoreBottomSheetView()
						}
					}
					.padding(.bottom, 12)
					
					Divider()
						.padding(.bottom, 12)
				}
				
				VStack(alignment: .leading, spacing: 12) {
					Text("숙소 편의시설")
						.font(.headline)
						.fontWeight(.semibold)
						.padding(.bottom, 5)
					
					ForEach(0..<5) { facility in
						HStack(spacing: 10) {
							Image(systemName: "person.fill.turn.down")
							Text("주방")
								.font(.footnote)
						}
					}
					
					Button {
						
					} label: {
						HStack(spacing: 0) {
							Spacer()
							Text("편의 시설 ")
							Text("54" + "개")
							Text("모두 보기")
							Spacer()
						}
						.font(.footnote)
						.padding(14)
					}
					.buttonStyle(.plain)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color.black, lineWidth: 0.8)
					)
					.padding(.bottom, 12)
					
					Divider()
						.padding(.bottom, 12)
				}
				
				VStack(alignment: .leading, spacing: 12) {
					Text("호스팅 지역")
						.font(.headline)
						.fontWeight(.semibold)
					// FIXME: 구글맵 들어오도록 변경
					Rectangle()
						.frame(height: 200)
						.foregroundColor(.yellow)
					
					HStack(spacing: 0) {
						Text("Wardensville")
						Text(", ")
						Text("웨스트버지니아")
						Text(", ")
						Text("미국")
					}
					.font(.footnote)
//					.fontWeight(.semibold)
					.padding(.bottom, 5)
					
					Text("(서울=연합뉴스) 계승현 기자 = 특수강도 혐의로 서울구치소에 수감됐다가 병원 치료 중 달아난 김길수(36)가 6일 검거됐다. 수사당국에 따르면 경찰은 도주 사흘째인 이날 오후 경기도 의정부에서 김씨를 검거했다.앞서 김씨는 지난 4일 오전 6시 20분께 경기도 안양시 동안구 한림대학교 성심병원에서 진료받던 중 자신을 감시하던 교정당국 관계자들에게 화장실을 사용하겠다")
						.font(.footnote)
				
					Button {
						print("화면전환")
					} label: {
						HStack(spacing: 3) {
							Text("더 보기")
								.font(.footnote)
								.fontWeight(.semibold)
								.underline()
							Image(systemName: "chevron.right")
								.font(.footnote)
						}
					}
					.buttonStyle(.plain)
					
					Divider()
						.padding(.bottom, 12)
				}
				
				VStack(alignment: .leading, spacing: 0) {
					HStack(spacing: 4) {
						Image(systemName: "star.fill")
						Text("5.0")
						Text("·")
						Text("후기")
						Text("6개")
					}
					.font(.headline)
					.padding(.bottom, 15)
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 16) {
							ForEach(1..<6) { review in
								HStack(spacing: 0) {
									VStack(alignment: .leading, spacing: 0) {
										Text("좋았어요.")
										Spacer()
										HStack(spacing: 3) {
											Text("더 보기")
												.font(.footnote)
												.fontWeight(.semibold)
												.underline()
											Image(systemName: "chevron.right")
												.font(.footnote)
										}
										HStack {
											Image("mainTest")
												.resizable()
												.scaledToFill()
												.frame(width: 64, height: 64)
												.clipShape(Circle())
										}
									}
									.frame(width: 240, height: 200)
									.padding(10)
									.overlay {
										RoundedRectangle(cornerRadius: 10)
											.stroke(Color.gray, lineWidth: 0.6)
									}
									Spacer()
								}
							}
						}
					}
					.padding(.bottom, 12)
					
					Button {
						
					} label: {
						HStack(spacing: 0) {
							Spacer()
							Text("후기")
							Text("6" + "개")
							Text("모두 보기")
							Spacer()
						}
						.font(.footnote)
						.padding(14)
					}
					.buttonStyle(.plain)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color.black, lineWidth: 0.8)
					)
					.padding(.bottom, 12)
				}
			}
//			.padding(.horizontal, 20)
		}
//		.navigationBarHidden(true)
//		.navigationBarBackButtonHidden(true)
//		.navigationViewStyle(.stack)
	}
}

struct ListingDetailView_Previews: PreviewProvider {
	static var previews: some View {
		ListingDetailView()
	}
}
