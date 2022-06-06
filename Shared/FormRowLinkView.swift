//
//  FormRowLinkView.swift
//  coreDataSwiftUi
//
//  Created by Amir on 4/12/22.
//

import SwiftUI

struct FormRowLinkView: View {
    
    //MARK: - Properties
    
    var icon : String
    var color : Color
    var text : String
    var link : String
    
    //MARK: - Body

    var body : some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(Color.white)
            } //: ZStack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text).foregroundColor(Color.gray)
            
            Spacer()
            
            Button(action: {
                // access to Link
                guard let url = URL(string: self.link),
                      UIApplication.shared.canOpenURL(url) else {
                          return
                      }
                UIApplication.shared.open(url as URL)
            }){
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            } //: Button
            .accentColor(Color(.systemGray2))
        } //: Hstack
        
    }

}

//MARK: - Preview
struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: Color.pink, text: "Linkedin", link: "https://www.linkedin.com/in/amir-j-5385201ab")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
