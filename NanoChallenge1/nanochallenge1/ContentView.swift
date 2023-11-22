//
//  ContentView.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var noteViewModel = NoteViewModel()
    @State var searchText = ""
    var body: some View {
        NavigationView {
        NavigationStack {
            
            List{
                ForEach(searchResult){note in
                    NavigationLink(destination: NewNoteView(note: note, noteViewModel: noteViewModel), label: {
                        Text(note.title)
                            .padding(.vertical, 10)
                        
                    })
                }
            }.navigationTitle("Notes")
            
            Spacer()
            ZStack(alignment: .trailing) {
                
                HStack{
                    Spacer()
                    
                    Text("Total Notes: \(noteViewModel.notesCount())")
                        .padding()
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    NavigationLink(destination: NewNoteView(note: NoteModel(title: "", text: "", noteDate: Date()), noteViewModel: noteViewModel)) {
                        Image(systemName: "square.and.pencil")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.yellow)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                    }
                }
                .padding(.bottom, 20)
                .padding(.trailing, 20)
                
                
            }
            
            
        }.searchable(text: $searchText)
                
        }.accentColor(.yellow)
}
    
    var searchResult:[NoteModel]{
        if searchText.isEmpty {
            return noteViewModel.notesArray
        } else {
            return noteViewModel.notesArray.filter {$0.title.localizedCaseInsensitiveContains(searchText.lowercased())}
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var note: NoteModel
    var body: some View {
        VStack {
            Text(note.text)
        }
    }
}
