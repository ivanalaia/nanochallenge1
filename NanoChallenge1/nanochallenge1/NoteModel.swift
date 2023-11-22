//
//  NoteModel.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 14/11/23.
//

import SwiftUI
import SwiftData


class NoteModel : Identifiable{
    var id=UUID()
    var title: String
    var text: String
    var noteDate: Date
    init(id: UUID = UUID(), title: String, text: String, noteDate: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.noteDate = noteDate
    }
}
