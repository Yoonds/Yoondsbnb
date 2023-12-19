//
//  ListingImageCarouselView.swift
//  Yoondsbnb
//
//  Created by YoonDaeSung on 2023/11/05.
//

import SwiftUI

struct ListingImageCarouselView: View {
	
	var images = [
		"mainTest",
		"mainTest2",
		"mainTest3",
		"mainTest4"
	]
	
    var body: some View {
		TabView {
			ForEach(images, id: \.self) { image in
				Image(image)
					.resizable()
					.scaledToFill()
			}
		}
		.frame(height: 320)
		.clipShape(RoundedRectangle(cornerRadius: 13))
		.tabViewStyle(.page)
    }
}

struct ListingImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageCarouselView()
    }
}
