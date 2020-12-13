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
            if let url = URL(string: "https://gettime.ga/schema/vm-20_el_a") {
                do {
                    let contents = try String(contentsOf: url)
                    let doc: Document = try SwiftSoup.parse(contents)
                    for element in try doc.select("img").array(){
                        let image_link = try element.attr("src")
                        let full_link = URL(string: "https://gettime.ga"+image_link)!
                        print(full_link)
                        let data = try? Data(contentsOf: full_link)
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            print(image!)
                        }

                    }
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
