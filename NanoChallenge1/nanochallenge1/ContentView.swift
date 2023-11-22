//
//  ContentView.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var notes: [NoteModel]
    @State var searchText = ""
    var body: some View {
        NavigationView {
            NavigationStack {
                
                List{
                    ForEach(searchResult){note in
                        NavigationLink(destination: NewNoteView(note: note), label: {
                            if let title = lines(note: note).first {
                            let secondLine = lines(note: note)[1]
                                VStack(alignment: .leading){
                                    Text(title)
                                        .bold()
                                    HStack {
                                        Text(formattedDate(date: Date()))
                                        Text(secondLine)
                                    }.foregroundStyle(Color.gray)
                                        .font(.footnote)
                                        .lineLimit(1)
                                }
                            }
                        })
                    }.onDelete(perform: deleteNote)
                }.navigationTitle("Notes")
                
                Spacer()
                ZStack(alignment: .trailing) {
                    
                    HStack{
                        Spacer()
                        
                        Text("Total Notes: \(notes.count)")
                            .padding()
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        NavigationLink(destination: NewNoteView(note: NoteModel(text: "", noteDate: Date()))) {
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
            return notes
        } else {
            return notes.filter {$0.text.localizedCaseInsensitiveContains(searchText.lowercased())}
        }
    }
    private func deleteNote(offsets: IndexSet) {
        for index in offsets {
            context.delete(notes[index])
        }
    } 
    private func lines(note: NoteModel) -> [String] {
        return note.text.components(separatedBy: "\n")
    }
    private func formattedDate(date: Date) ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: NoteModel.self)
}
