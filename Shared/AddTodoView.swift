//
//  AddTodoView.swift
//  coreDataSwiftUi
//
//  Created by Amir on 4/12/22.
//

import SwiftUI

struct AddTodoView: View {
    
    // MARK: -Properties
    
    // match to managedObjectContext in contentView
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage : String = ""
    
    // MARK: -BODY
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading, spacing: 20){
                    TextField("Todo" , text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    Picker("Priority" , selection: $priority){
                        ForEach(priorities , id: \.self){
                            Text($0)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Button(action: {
                            if self.name != "" {
                                let todo = Item(context: self.managedObjectContext)
                                todo.name = self.name
                                todo.priority = self.priority
                                
                                do{
                                    try self.managedObjectContext.save()
                                }catch{
                                    print(error)
                                }
                                }else{
                                    self.errorShowing = true
                                    self.errorTitle = "Invalid Name"
                                    self.errorMessage = "Make sure to enter something for\nther new todo item"
                                    return
                                
                            }
                            self.presentationMode.wrappedValue.dismiss()

                        }){
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(9)
                                .foregroundColor(Color.white)
                            
                        } //: Save btn
                    
                }//: VSTAck
                .padding(.horizontal)
                .padding(.vertical,30)
                
                Spacer()
            }
            .navigationBarTitle("New TODO", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark")
            }
            )
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                 
            }
        } //: NAVIGATION
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
