//
//  DateDetailView.swift
//  Yoondsbnb
//
//  Created by Yoon Daesung on 1/23/24.
//

import SwiftUI

struct DateDetailView: View {
    
    enum PickerKind: CaseIterable, CustomDebugStringConvertible, Identifiable {
        case date, month, flexible
        
        var id: Self { self }
        var debugDescription: String {
            switch self {
            case .date:
                return "날짜 지정"
            case .month:
                return "월 단위"
            case .flexible:
                return "유연한 일정"
            }
        }
    }
    
    @State private var selctedPicker: PickerKind = .date
    
    @Binding var selectedOption: DestinationSearchOptions
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("언제 여행 가실 예정인가요?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.bottom, 15)
                
                Picker("picker date", selection: $selctedPicker) {
                    ForEach(PickerKind.allCases) { picker in
                        Text(picker.debugDescription)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: proxy.size.width / 1, height: proxy.size.height / 12)
                
                switch selctedPicker {
                case .date:
                    PickerDateView()
                case .month:
                    PickerMonthView()
                case .flexible:
                    FlexibleView()
                }

                Spacer()
                
                Divider()
                    .padding(.bottom, proxy.size.height / 35)
                
                HStack(spacing: 0) {
                    Button(action: {
                        
                    }, label: {
                        Text("건너 뛰기")
                            .underline(true)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        selectedOption = .guests
                    }, label: {
                        RoundedRectangle(cornerRadius: 13)
                            .fill(Color.black)
                            .frame(width: proxy.size.width / 2.5, height: proxy.size.height / 14)
                            .overlay {
                                Text("다음")
                                    .foregroundStyle(.white)
                            }
                            
                    })
                }
            }
        }
    }
}

extension DateDetailView {
    
    struct BottomAddDateButton: View {
        
        let image: String?
        let title: String
        
        var body: some View {
            HStack(spacing: 10) {
                if let image = image {
                    Image(systemName: image)
                    Text(title + "일")
                } else {
                    Text(title)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .overlay {
                Capsule()
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(Color(.systemGray4))
            }
        }
        
    }
    
    struct PickerDateView: View {
        
        @State private var selectedDate = Date()
        
        var body: some View {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    DatePicker(
                            "Start Date",
                            selection: $selectedDate,
                            in: Date()...,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    Divider()
                        .padding(.bottom, proxy.size.height / 35)
                    
                    // TODO: 슬라이드 버튼으로 수정 예정
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            BottomAddDateButton(image: nil, title: "정확한 날짜")
                            BottomAddDateButton(image: "plusminus", title: "1")
                            BottomAddDateButton(image: "plusminus", title: "2")
                            BottomAddDateButton(image: "plusminus", title: "3")
                            BottomAddDateButton(image: "plusminus", title: "3")
                            BottomAddDateButton(image: "plusminus", title: "7")
                        }
                    }
                }
            }
        }
    }
    
    struct PickerMonthView: View {
        
        var body: some View {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    Text("월 뷰")
                }
            }
        }
        
    }
    
    struct FlexibleView: View {
        
        var body: some View {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    Text("플렉스 뷰")
                }
            }
        }
        
    }
    
}
