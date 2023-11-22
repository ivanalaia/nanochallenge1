//
//  NoteModel.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 14/11/23.
//

import SwiftUI
import SwiftData

@Model
class NoteModel : Identifiable{
 
    var id: String
    var text: String
    var noteDate: Date
    
    init(text: String, noteDate: Date) {
        self.id = UUID().uuidString
        self.text = text
        self.noteDate = noteDate
    }
}
