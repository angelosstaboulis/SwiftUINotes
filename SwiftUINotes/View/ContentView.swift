//
//  ContentView.swift
//  SwiftUINotes
//
//  Created by Angelos Staboulis on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var editor:String
    @State var iNotes = Notes(editor: .constant(""))
    @State var isPresented:Bool
    @State var isPresentedFind:Bool = false
    var body: some View {
        HStack {
            Color.blue.overlay {
                Text("SwiftUINotes")
            }
        }.frame(width:UIScreen.main.bounds.width,height:45,alignment:.topLeading)
        Spacer()
        HStack{
            HStack{
                Menu {
                    Button(action: {
                        iNotes.setText(text: "")
                    }, label: {
                        Text("New File")
                    })
                    Button(action: {
                        iNotes.setText(text: Helper.shared.openFile(filename: "export.txt"))
                    }, label: {
                        Text("Open")
                    })
                    Button(action: {
                        Helper.shared.saveFile(filename: "export.txt", data: iNotes.getText())
                    }, label: {
                        Text("Save")
                    })
                    Button(action: {
                        Helper.shared.exportPDF(text: iNotes.getText())
                    }, label: {
                        Text("Export PDF")
                    })
                   
                } label: {
                    Text("File")
                }
                Menu {
                    Button(action: {
                        iNotes.cutText()
                    }, label: {
                        Text("Cut")
                    })
                    Button(action: {
                        iNotes.copyText()
                    }, label: {
                        Text("Copy")
                    })
                    Button(action: {
                        iNotes.pasteText()
                    }, label: {
                        Text("Paste")
                    })
                    Button(action: {
                        iNotes.selectAllText()
                    }, label: {
                        Text("Select All")
                    })
                } label: {
                    Text("Edit")
                }
                Menu {
                    Button(action: {
                        iNotes.findReplaceText()
                    }, label: {
                        Text("Find Text")
                    })
                    Button(action: {
                        iNotes.findReplaceText()
                    }, label: {
                        Text("Replace Text")
                    })
                  
                } label: {
                    Text("Search")
                }
                Menu {
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("About")
                    })
                } label: {
                    Text("About")
                }.alert("About", isPresented: $isPresented) {
                    Text("SwiftUINotes 1.0").font(.largeTitle)
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("OK")
                    })
                }
            }
        }.frame(width:360,height:45,alignment: .leading)
        NavigationStack{
            iNotes
                .colorMultiply(.blue)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView(editor: "", isPresented: false, isPresentedFind: false)
}
