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
    
    let clients = [
            "Luigi Moretti",
            "Giovanni Peroni",
            "Maria Molecolare",
            "Tonino Susanìn",
            "Luigi Luca Coletta"
        ]
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                SearchBar2(text: self.$searchText, placeholder: "Search...", prompt: "", elementColor: nil, barColor: nil, searchFieldColor: nil, searchTextColor: nil, placeholderColor: .systemGray, backgroundImage: nil, searchIcon: nil)
                //customised search bar call, colors and images are optionals: do not specify anything if you want default settings
                
                List{
                    ForEach(searchText.isEmpty ? clients : clients.filter{$0.localizedCaseInsensitiveContains(searchText)}, id:\.self)
                    {
                        client in
                        Text(client)
                    }
                    //checks current string and visualise it if contains the substring searchText
              }
          }
            .navigationTitle(searchText.isEmpty ? "Inbox" : "Searching") //changes navigationTitle if the user is typing, attached to the list view because it needs to be updated while building the list
       }
        
     }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
