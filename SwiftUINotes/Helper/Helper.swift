//
//  Helper.swift
//  SwiftUINotes
//
//  Created by Angelos Staboulis on 9/1/24.
//

import Foundation
import PDFKit
class Helper{
    static let shared = Helper()
    private init(){}
    
    func openFile(filename:String) -> String{
        return String(data: FileManager.default.contents(atPath: Bundle.main.resourceURL!.path() + filename)!, encoding: .utf8)!
    }
   
    func saveFile(filename:String,data:String){
        FileManager.default.createFile(atPath:Bundle.main.resourceURL!.path() + filename, contents: data.data(using: .utf8))
    }
    func exportPDF(text:String){
        do{
            let pdf = UIGraphicsPDFRenderer(bounds: .zero)
            try pdf.writePDF(to: URL(filePath:Bundle.main.resourceURL!.path()+"export.pdf")) { context in
                context.beginPage()
                let title = NSMutableAttributedString(string: text)
                title.draw(in: UIScreen.main.bounds)
            }
        }catch{
            debugPrint("Something went wrong!!",error.localizedDescription)
        }
    }
}
