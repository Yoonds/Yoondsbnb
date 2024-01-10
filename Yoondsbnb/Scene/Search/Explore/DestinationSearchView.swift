//
//  DestinationSearchView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/12/18.
//

import SwiftUI

// FIXME: 상태관리 뷰모델에서 할지 고민
fileprivate enum DestinationSearchOptions {
    
    case basic
    case location
    case dates
    case guests
    
}

struct DestinationSearchView: View {
    
    @Binding var isShowDestinationSearchView: Bool
    
    @State private var isShowBottomSheet: Bool = false
    @State private var selectedOption: DestinationSearchOptions = .basic
    @State private var destination = ""
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button {
                        selectedOption == .basic
                        ? isShowDestinationSearchView.toggle()
                        : (selectedOption = .basic)
                    } label: {
                        Image(systemName: selectedOption == .basic
                              ? "xmark.circle"
                              : "arrowshape.backward.circle"
                        )
                        .imageScale(.medium)
                        .foregroundColor(.black)
                    }
                    Spacer()
                    HStack(spacing: 15) {
                        Text("숙소")
                        Text("체험")
                    }
                    Spacer()
                }
                .padding(
                    EdgeInsets(
                        top: 15,
                        leading: 20,
                        bottom: 15,
                        trailing: 40
                    )
                )
            }
            
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    if selectedOption == .basic {
                        HStack(spacing: 0) {
                            Text("여행지를 알려주세요")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.bottom, 15)
                    }
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            selectedOption == .basic
                            ? Color.clear
                            : Color(.systemGray6)
                        )
                        .stroke(selectedOption == .basic
                                ? Color(.systemGray3)
                                : Color.clear
                        )
                        .overlay {
                            HStack(spacing: 15) {
                                Image(systemName: "magnifyingglass")
                                    .imageScale(.small)
                                TextField("", text: $destination, prompt: Text("여행지 검색")
                                    .font(.caption)
                                    .foregroundColor(Color(.systemGray))
                                )
                            }
                            .padding(15)
                        }
                        .frame(height: 50)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            withAnimation() {
                                selectedOption = .location
                            }
                        }
                }
                .padding(
                    EdgeInsets(
                        top: 20,
                        leading: 20,
                        bottom: 0,
                        trailing: 20
                    )
                )
                
                if selectedOption == .basic {
                    VStack(spacing: 0) {
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
                    }
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 20,
                            bottom: 20,
                            trailing: 0
                        )
                    )
                }
                
                if selectedOption == .location {
                    Spacer()
                }
                // FIXME: 여기까지 확인 완료 한줄씩 체크하면서 코드 확인
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding(
                EdgeInsets(
                    top: 0,
                    leading: selectedOption == .basic ? 20 : 0,
                    bottom: selectedOption == .basic ? 20 : 0,
                    trailing: selectedOption == .basic ? 20 : 0
                )
            )
            
            if selectedOption == .location {
                Spacer()
            }
            
            if selectedOption == .basic {
                VStack(spacing: 0) {
                    
                    VStack(spacing: 0) {
                        CollapsedPickerView(title: "날짜", description: "일주일")
                    }
                    .padding(.bottom, 20)
                    .onTapGesture {
                        withAnimation {
                            selectedOption = .dates
                        }
                    }
                    
                    VStack(spacing: 0) {
                        CollapsedPickerView(title: "여행자", description: "게스트 추가")
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedOption = .guests
                        }
                    }
                    
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
                    .padding(
                        EdgeInsets(
                            top: 20,
                            leading: 20,
                            bottom: 10,
                            trailing: 20
                        )
                    )
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
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
    
    struct LocationBottomSheet: View {
        
        @Binding var destination: String
        
        var body: some View {
            Text("목적지 뷰")
        }
        
    }
    
    struct DatesBottomSheet: View {
        
        var body: some View {
            Text("날짜 바텀")
        }
        
    }
    
    struct GuestsBottomSheet: View {
        
        var body: some View {
            Text("게스트 바텀")
        }
        
    }
    
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(isShowDestinationSearchView: .constant(false))
    }
}
