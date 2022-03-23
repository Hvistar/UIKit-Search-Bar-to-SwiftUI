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
            "Giovanni Peroni"
        ]
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                SearchBar2(text: self.$searchText, color: .green) //fare un esempio di customizzazione
                List{
                    
                    ForEach(searchText.isEmpty ? clients : clients.filter{$0.localizedCaseInsensitiveContains(searchText)}, id:\.self)
                    //checks current string and visualise it if contains the substring searchText
                    {
                        client in
                        Text(client)
                    }

              }
          }
            .navigationTitle(searchText.isEmpty ? "Inbox" : "Searching") //changes navigationTitle if the user is typing
       }
        
     }
   }
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
