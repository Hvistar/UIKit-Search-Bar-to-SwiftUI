//
//  SearchBar2.swift

import SwiftUI
import Foundation

struct SearchBar2: UIViewRepresentable {
    //to make UIKit code integrate into SwiftUI
    @Binding var text: String
    
    let backgroundImage = UIImage(named: "Untitled 2.png")
    
    class Coordinator: NSObject, UISearchBarDelegate{
       //updates the current state of the view
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange
                       searchText: String){
            text = searchText
        }
        //tells the delegate that the user changed the search text
        
    }
    
    func makeCoordinator() -> SearchBar2.Coordinator {
        return Coordinator(text: self.$text)
    }//custom instance to communicate changes from view controller to SwiftUI interface
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar2>) -> UISearchBar {
        
        let searchBar2 = UISearchBar(frame: .zero)
        //location and size of the search bar on declaration
        
        //MARK: Some examples of Search Bar customisation 
        
        searchBar2.searchBarStyle = .minimal
        //search bar style: minimal removes background and gives a cleaner appearance
        searchBar2.delegate = context.coordinator
        //delegate of the search bar to modify its behaviour
        searchBar2.autocapitalizationType = .words
        //autocapitalization for the first letter of each word
        searchBar2.placeholder = "Search..."
        //text displayed on top of the search bar
        searchBar2.prompt = "Prompt..."
        //line of text to be displayed on top of the search bar
        searchBar2.barTintColor = .red
        //tint color of the bar's background, no effect if searchBarStyle is minimal
        searchBar2.tintColor = .red
        //tint color of the bar's main element
        
        return searchBar2
        
    }//initial state of the view
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar2>) {
        uiView.text = text
    }//updated state of the view
    
}

struct SearchBar2_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar2(text: .constant(""))
    }
}
