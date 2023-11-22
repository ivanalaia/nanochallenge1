//
//  NewNoteView.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 15/11/23.
//

import SwiftUI
import SwiftData

struct NewNoteView: View {
    @Environment(\.modelContext) private var context
    @Bindable var note: NoteModel
    
    
    var body: some View {
        VStack {
            TextEditor(text: $note.text)
                    .frame(minHeight: 300)
                    .padding()
            Spacer()
        }.onDisappear {
            addNote()
        }
        .navigationBarTitle("New Note", displayMode: .inline)
    }
    private func addNote() {
        context.insert(note)
    }
}


