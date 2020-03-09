//
//  PageView.swift
//  ByTheWindow
//
//  Created by 徐滔锴 on 2020/3/9.
//  Copyright © 2020 JJAYCHEN. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        
        VStack {
            ZStack {
                PageViewController(controllers: viewControllers, currentPage: $currentPage)
                    
//                PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
//                    .padding(.trailing)

            }
            Text("CurrentPage: \(currentPage)")
        }
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageView(
            cards.map{ CardView(showCard: $0) }
            )
    }
}