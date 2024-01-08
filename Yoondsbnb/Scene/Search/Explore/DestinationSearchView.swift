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
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .basic {
        didSet {
            if selectedOption != .basic {
                isShowBottomSheet.toggle()
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
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
                .padding(.trailing, 110)
                
                HStack(spacing: 15) {
                    Text("숙소")
                    Text("체험")
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading) {
                if selectedOption == .basic {
                    Text("여행지를 알려주세요")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("여행지 검색", text: $destination)
                        .font(.caption)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    Color(selectedOption == .location ? .systemGray2 : .clear)
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(
                            Color(selectedOption == .location
                                  ? .systemGray6
                                  : .clear
                                 )
                        )
                }
                .onTapGesture {
                    withAnimation() {
                        selectedOption = .location
                    }
                }
                .padding(.bottom, 15)
                
                if selectedOption == .location {
                    Spacer()
                }
                
                if selectedOption == .basic {
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
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 10)
            .padding(selectedOption == .location ? 0 : 17.0)
            
            VStack(spacing: 0) {
                if selectedOption == .basic {
                    CollapsedPickerView(title: "날짜", description: "일주일")
                }
            }
            .onTapGesture {
                selectedOption = .dates
            }
                
            VStack(spacing: 0) {
                if selectedOption == .basic {
                    CollapsedPickerView(title: "여행자", description: "게스트 추가")
                }
            }
            .onTapGesture {
                selectedOption = .guests
            }
            
            Spacer()
            
            if selectedOption == .basic {
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
            }
        }
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
