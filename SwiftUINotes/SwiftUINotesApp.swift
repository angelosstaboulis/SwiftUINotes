//
//  SwiftUINotesApp.swift
//  SwiftUINotes
//
//  Created by Angelos Staboulis on 9/1/24.
//

import SwiftUI

@main
struct SwiftUINotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(editor: "", isPresented: false, isPresentedFind: false)
        }
    }
}
