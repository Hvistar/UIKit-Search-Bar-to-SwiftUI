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
                
                SearchBar2(text: self.$searchText, placeholder: "Type to search...", prompt: "Custom search bar", elementColor: .systemPurple, barColor: .systemGray5, searchFieldColor: nil, searchTextColor: .systemPurple, placeholderColor: UIColor(red: 0.36, green: 0.34, blue: 0.0, alpha: 1.0), backgroundImage: UIImage(named: "Pattern.jpeg"), searchIcon: UIImage(systemName: "text.magnifyingglass")?.withTintColor(UIColor(red: 0.46, green: 0.34, blue: 0.0, alpha: 1.0), renderingMode: .alwaysOriginal))
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
