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
            .padding(.leading, 16)
            
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
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("날짜")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Spacer()
                Text("일주일")
                    .font(.caption)
            }
            .padding(17)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("여행자")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Spacer()
                Text("게스트 추가")
                    .font(.caption)
            }
            .padding(17)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(isShow: .constant(false))
    }
}
