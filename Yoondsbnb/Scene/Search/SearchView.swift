//
//  SearchView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/04/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SerachViewModel()
    
    @State var serachText: String = ""
    @State var isSelectedSearchBar: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                VStack(alignment: .leading, spacing: 0) {
                    Text("어디로 여행가세요?")
                    TextField("어디든지 언제든 일주일 게스트 추가", text: $serachText)
                }
                Image(systemName: "slider.horizontal.3")
                    .padding(10)
                    .overlay(
                        Circle()
                            .stroke(.gray)
                    )
                    .onTapGesture {
                        print("필터 클릭")
                    }
            }
            .font(.headline)
            .padding(10)
            .background(
                RoundedRectangle(cornerSize: CGSize(width: 30.0, height: 30.0))
                    .fill(Color.white)
                    .shadow(
                        color: .gray.opacity(0.3),
                        radius: 15, x: 0, y: 0
                    )
            )
            .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHGrid(rows: [GridItem(.flexible(minimum: 5))], alignment: .bottom, spacing: 10) {
                    ForEach(viewModel.mainSlideDatas) { data in
                        VStack(alignment: .center, spacing: 3) {
                            Image(systemName: data.iconName)
                            Text(data.travelTitle)
                                .font(.system(size: 13))
                        }
                    }
                }
                .frame(height: 40)
            }
            .padding(.bottom, 7)
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.mainImageDatas) { data in
                    VStack(spacing: 0) {
                        Image(data.image)
                            .resizable()
                            .cornerRadius(15)
                            .padding(.bottom, 15)
                            .overlay(alignment: .topTrailing) {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .offset(x: -20, y: 20)
                            }
                        HStack(spacing: 0) {
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 2) {
                                    HStack(spacing: 3) {
                                        Text(data.country)
                                        Text(data.region)
                                    }
                                    Text(data.description)
                                        .foregroundColor(Color.gray)
                                    Text(data.startDate + "~" + data.endDate)
                                        .padding(.bottom, 3)
                                        .foregroundColor(Color.gray)
                                }
                                Text("₩"+String(data.price.formatPrice()))
                                    .font(.headline)
                            }
                            Spacer()
                            VStack(spacing: 0) {
                                HStack(spacing: 3){
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 13, height: 13)
                                    Text(String(format: "%.1f", data.grade))
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .preferredColorScheme(.light)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SerachViewModel())
    }
}
