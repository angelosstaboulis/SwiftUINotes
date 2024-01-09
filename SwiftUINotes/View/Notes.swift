//
//  Notes.swift
//  SwiftUINotes
//
//  Created by Angelos Staboulis on 9/1/24.
//

import Foundation
import SwiftUI
struct Notes:UIViewRepresentable{
    let notes = UITextView()
    @Binding var editor:String
    typealias UIViewType = UITextView
    func makeUIView(context: Context) -> UITextView {
        return notes
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        notes.text = editor
        notes.isFindInteractionEnabled = true
    }
    func setText(text:String){
        notes.text = text
    }
    func getText()->String{
        return notes.text
    }
    func cutText(){
        notes.cut(nil)
    }
    func copyText(){
        notes.copy(nil)
    }
    func pasteText(){
        notes.paste(nil)
    }
    func selectAllText(){
        notes.selectAll(nil)
    }
    func findReplaceText(){
        notes.findAndReplace(nil)
    }
}
