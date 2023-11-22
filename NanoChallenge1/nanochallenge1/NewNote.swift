//
//  NewNoteView.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 15/11/23.
//

import SwiftUI
import SwiftData

struct NewNoteView: View {
    var note: NoteModel
    @State private var noteText: String = ""
    @ObservedObject var noteViewModel: NoteViewModel
    
    
    var body: some View {
        VStack {
            if let noteToUpdate = $noteViewModel.notesArray.first(where: {$0.id == note.id})?.text{
                TextEditor(text: noteToUpdate)
                    .frame(minHeight: 300)
                    .padding()
            }
            Spacer()
        }
        .navigationBarTitle("New Note", displayMode: .inline)
        .navigationBarItems(trailing: Button("Fine") {
            let newNote = NoteModel(title: "Titolo", text: "", noteDate: Date())
            self.noteViewModel.addNote(newNote: newNote)
        })
    }
}


