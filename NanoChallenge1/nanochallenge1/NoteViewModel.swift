//
//  NoteViewModel.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 14/11/23.
//

import Foundation
import SwiftData
import Combine


class NoteViewModel: ObservableObject {
    @Published var notesArray: [NoteModel] = [NoteModel(title: "ciao", text: "c", noteDate: Date())]
    func addNote(newNote: NoteModel) {
        notesArray.append(newNote)
    }
    func notesCount() -> Int {
            return notesArray.count
        }
}
