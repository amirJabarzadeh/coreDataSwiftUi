//
//  ContentView.swift
//  Shared
//
//  Created by Amir on 4/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: -PROPERTIES
    // assess the internal storage
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)]) var todos: FetchedResults<Item>
    
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var animationButton: Bool = false
    
    //MARK: -BODY
    var body: some View {
        NavigationView{
            ZStack {
                List{
                    ForEach(self.todos, id: \.self) { todo in
                        HStack{
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(self.colorize(priority: todo.priority ?? "Normal"))
                            Text(todo.name ?? "Unknown")
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                    Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        } //: Hstack
                        .padding(.vertical, 10)
                    } //: Foreach
                    .onDelete(perform: deleteTodo)
                }//: List
                .navigationBarTitle("TODO", displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        Button(action: {
                            // show add todo btn
                            self.showingSettingsView.toggle()
                        }) {
                            Image(systemName: "gear")
                        } // Add btn
                        .sheet(isPresented: $showingSettingsView) {
                            SettingsView()
                        }
                )
                
                //MARK: -NO TODO ITEMS
                if todos.count == 0 {
                    EmptyListView()
                }
            } //: ZStack
            
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
            }
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animationButton ? 0.2 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animationButton ? 0.15 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                        
                    } //: Group
                    
                    Button(action: {
                        self.showingAddTodoView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                        
                } //: Button
                    .onAppear {
                        self.animationButton.toggle()
                    }
                } //: ZSTACK
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
                
            )
        } // Navigation
    }
    
    // MARK: - FUNCTIONS
    private func deleteTodo(att offsets: IndexSet){
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do{
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    private func colorize(priority: String) -> Color {
      switch priority {
      case "High":
        return .pink
      case "Normal":
        return .green
      case "Low":
        return .blue
      default:
        return .gray
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
