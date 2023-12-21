//
//  DestinationSearchView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/12/18.
//

import SwiftUI

struct DestinationSearchView: View {
    
    @Binding var isShow: Bool
    
    @State private var destination = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                Button {
                    withAnimation(.easeIn) {
                        isShow.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                .padding(.trailing, 110)
                
                HStack(spacing: 15) {
                    Text("숙소")
                    Text("체험")
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading) {
                Text("여행지를 알려주세요")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("여행지 검색", text: $destination)
                        .font(.caption)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.0)
                        .foregroundColor(Color(.systemGray4))
                }
                .padding(.bottom, 15)
                
                // FIXME: 우측 패딩값을 덮어서 스크롤하도록 변경
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(1..<6) { continent in
                            VStack(alignment: .leading) {
                                Image("mainTest")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(8)
                                Text("유럽")
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding(.bottom, 10)
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 10)
            .padding(.horizontal)
            
            CollapsedPickerView(title: "날짜", description: "일주일")
            CollapsedPickerView(title: "여행자", description: "게스트 추가")
            
            Spacer()
            
            Divider()
            HStack(spacing: 0) {
                Text("전체 삭제")
                    .underline()
                Spacer()
                Button {
                    print("검색") // TODO: 검색기능 추가
                } label: {
                    HStack(spacing: 7) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.medium)
                        Text("검색")
                    }
                    .padding(
                        EdgeInsets
                            .init(top: 10, leading: 12, bottom: 10, trailing: 15)
                    )
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(EdgeInsets
                .init(top: 0, leading: 20, bottom: 10, trailing: 20)
            )
            .background(.white)
        }
        .toolbar(.hidden, for: .tabBar)
        .background(.white)
        .opacity(0.97)
    }
}

private extension DestinationSearchView {
    
    struct CollapsedPickerView: View {
        
        let title: String
        let description: String
        
        var body: some View {
            HStack(spacing: 0) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Spacer()
                Text(description)
                    .font(.caption)
            }
            .padding(17)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding(.horizontal)
        }
        
    }
    
}


struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(isShow: .constant(false))
    }
}
