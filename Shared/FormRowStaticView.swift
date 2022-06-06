//
//  FormRowStaticView.swift
//  coreDataSwiftUi
//
//  Created by Amir on 4/12/22.
//

import SwiftUI

struct FormRowStaticView: View {
    
    //MARK: - Properties
    var icon : String
    var firstText : String
    var secondText : String
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            } //: Zstack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstText).foregroundColor(Color.gray)
            Spacer()
            Text(secondText)
        }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
        
    }
}
