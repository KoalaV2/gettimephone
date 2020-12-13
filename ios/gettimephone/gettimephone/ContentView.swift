//
//  ContentView.swift
//  gettimephone
//
//  Created by Theodor Johanson on 2020-12-13.
//

import SwiftUI
import SwiftSoup


func webscrape(){
        do {
            if let url = URL(string: "https://gettime.ga/schema/20_el_a") {
                do {
//                    let className = "schemaWeekDesktop"
                    let contents = try String(contentsOf: url)
                    //print(contents)
                    let doc: Document = try SwiftSoup.parse(contents)
                    let schema: Element = try doc.select("img[src$=.png]").first()!
                    print(schema)
                } catch {
                    print("Contents could not be loaded")
                }
            } else {
                print("Url was bad!")
            }
        }
}
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button(action: {
            webscrape()
        }) {
            Text("Press me!")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
