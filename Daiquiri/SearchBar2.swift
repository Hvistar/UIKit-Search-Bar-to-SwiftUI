//  SearchBar2.swift

import SwiftUI
import Foundation

struct SearchBar2: UIViewRepresentable {
    //to make UIKit code integrate into SwiftUI
    @Binding var text: String
    var color: UIColor
    
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
        
        searchBar2.delegate = context.coordinator
        //delegate of the search bar to modify its behaviour
        
        searchBar2.searchBarStyle = .default
        //search bar style: minimal removes background and gives a cleaner appearance
        searchBar2.autocapitalizationType = .words
        //autocapitalization for the first letter of each word
        searchBar2.placeholder = "Type to search..."
        //text displayed on top of the search bar
        searchBar2.prompt = "Custom search bar..."
        //line of text to be displayed on top of the search bar
        searchBar2.barTintColor = color
        //tint color of the bar's background, no effect if searchBarStyle is minimal
        searchBar2.tintColor = color
        //tint color of the bar's main element
        searchBar2.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .search, state: .normal)
        //change the search bar icon
        searchBar2.setSearchFieldBackgroundImage(backgroundImage, for: .normal)
        //sets a background image for the search field
        
        return searchBar2
        
    }//initial state of the view
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar2>) {
        uiView.text = text
    }//updated state of the view when text changes
    
}

struct SearchBar2_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar2(text: .constant(""), color: .green)
    }
}
