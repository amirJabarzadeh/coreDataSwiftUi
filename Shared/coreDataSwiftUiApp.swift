//
//  coreDataSwiftUiApp.swift
//  Shared
//
//  Created by Amir on 4/11/22.
//

import SwiftUI

@main
struct coreDataSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
