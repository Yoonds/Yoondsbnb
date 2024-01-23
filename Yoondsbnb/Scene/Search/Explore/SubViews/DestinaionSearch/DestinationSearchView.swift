//
//  DestinationSearchView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/12/18.
//

import SwiftUI

// FIXME: 상태관리 뷰모델에서 할지 고민
fileprivate enum DestinationSearchOptions {
    
    case location
    case dates
    case guests
    
}

struct DestinationSearchView: View {

    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    @Binding var isShowDestinationSearchView: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // 상단 탭
            HStack(spacing: 0) {
                Text("x")
                    .padding(8)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                    }
                Spacer()
                Text("숙소")
                    .padding(.trailing, 20)
                Text("체험")
                Spacer()
            }
            .padding(.horizontal, 5)
            
            // location
            if selectedOption == .location {
                VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("여행지를 알려주세요")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.bottom, 15)
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .imageScale(.small)
                                TextField("여행지 검색", text: $destination)
                                    .font(.caption)
                            }
                            .frame(height: 40)
                            .padding(5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundColor(Color(.systemGray4))
                            }
                            .padding(.bottom, 25)
                        }
                        .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(1..<6) { continent in
                                    VStack(alignment: .leading) {
                                        Image("mainTest")
                                            .resizable()
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(8)
                                            .padding(.bottom, 10)
                                        Text("유럽")
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                        .padding(.leading, 20)
                }
                .padding(EdgeInsets(top: 25, leading: 0, bottom: 15, trailing: 0))
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .padding(
                    EdgeInsets(
                        top: 20,
                        leading: selectedOption == .location ? 15 : 20,
                        bottom: 20,
                        trailing: selectedOption == .location ? 15 : 20
                    )
                )
            } else {
                CollapsedPickerView(title: "여행지", description: "유연한 검색")
                    .padding(
                        EdgeInsets(
                            top: 20, leading: 20, bottom: 20, trailing: 20
                        )
                    )
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedOption = .location
                        }
                    }
            }
            
            if selectedOption == .dates {
                VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("언제 여행 가실 예정인가요?")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.bottom, 15)
                            
                            HStack {
                                Text("날짜 지정")
                                Text("월 단위")
                                Text("유연한 일정")
                            }
                        }
                        .padding(.horizontal, 20)
                        Text("캘릭더 뷰")
                }
                .padding(EdgeInsets(top: 25, leading: 0, bottom: 15, trailing: 0))
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: selectedOption == .location ? 15 : 20,
                        bottom: 20,
                        trailing: selectedOption == .location ? 15 : 20
                    )
                )
            } else {
                CollapsedPickerView(title: "날짜", description: "일주일")
                    .padding(
                        EdgeInsets(
                            top: 0, leading: 20, bottom: 20, trailing: 20
                        )
                    )
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedOption = .dates
                        }
                    }
            }
            
            if selectedOption == .guests {
                Text("여행자 뷰")
            } else if selectedOption == .location {
                CollapsedPickerView(title: "여행자", description: "게스트 추가")
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedOption = .guests
                        }
                    }
                    
            }
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
        .background(.white)
    }
    
}

private extension DestinationSearchView {
    
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(isShowDestinationSearchView: .constant(false))
    }
}
