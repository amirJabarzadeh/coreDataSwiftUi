//
//  EmptyListView.swift
//  coreDataSwiftUi
//
//  Created by Amir on 4/12/22.
//

import SwiftUI

struct EmptyListView: View {
    
    // MARK: -Properties
    @State private var isAnimated: Bool = false
    
    let images: [String] = [
        "Illustrations1",
        "Illustrations2",
        "Illustrations3",
        "Illustrations4",
        "Illustrations5"
    ]
    

    
    let tips: [String] = [
        "Spread love everywhere you go.",
        "Do your Best",
        "Belive yourself",
        "Be courageous"
    ]
    //MARK: - BODY
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 20) {
                Image("\(images.randomElement() ?? images[0])")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)

                    .layoutPriority(1)
                
                
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
            } //: VSTACK
            .padding(.horizontal)
            .opacity(isAnimated ? 1: 0)
            .offset(y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1.5))
            .onAppear {
                self.isAnimated.toggle()
            }
            
        } //:ZSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .dark)

    }
}
