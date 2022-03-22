//
//  ContentView.swift
//  Daiquiri
//
//  Created by Luigi Luca Coletta on 22/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    
    var body: some View {
        SearchBar2(text: self.$searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
