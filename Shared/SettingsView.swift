//
//  SettingsView.swift
//  coreDataSwiftUi
//
//  Created by Amir on 4/12/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                //MARK: - Form
                Form{
                    HStack{
                        Image("ToDo app logo")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .trailing)
                        VStack{
                    Text("ToDo Application")
                            .fontWeight(.bold)
                            
                    
                    Text("Do your Best until achieve it")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                        }//: VStack
                        
                    }//: Hstack
                
                    
                    //MARK: Section 1

                    Section(header: Text("Follow me on Social Media")){
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Linkedin", link: "https://www.linkedin.com/in/amir-j-5385201ab")
                        
                    }
                    
                    // MARK: Section 1
                    Section(header: Text("About the Application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Amir Jabari")
                        FormRowStaticView(icon: "paintbrush", firstText: "iconDesigner", secondText: "FreePic")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } //: Section 2
                    .padding(.vertical, 3)

                } //: Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                //MARK: - Footer
                Text("Developed by ♡ ")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
                
            } //: VSTACK
            
            .navigationBarItems(trailing:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
            }//: Button
            )//: Navigation bar Items
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            
        } //: navigationView

}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
