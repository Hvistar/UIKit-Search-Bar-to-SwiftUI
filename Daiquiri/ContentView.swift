//
//  ContentView.swift
//  Daiquiri
//
//  Created by Luigi Luca Coletta on 22/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var searching = false //pass this to the search bar to modify the navigation bar while searching
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
        SearchBar2(text: self.$searchText)
                List{
                    
                }
            }
                .navigationTitle(searching ? "Searching" : "Inbox")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
