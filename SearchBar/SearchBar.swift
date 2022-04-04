//  SearchBar2.swift

import SwiftUI
import Foundation

struct SearchBar: UIViewRepresentable {
    //to make UIKit code integrate into SwiftUI
    @Binding var text: String
    
    var placeholder: String
    var prompt: String
    
    var elementColor: UIColor?    
    var barColor: UIColor?
    var searchFieldColor: UIColor?
    var searchTextColor: UIColor?
    var placeholderColor: UIColor?
    var backgroundImage: UIImage?
    var searchIcon: UIImage?
    
    
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
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: self.$text)
    }//custom instance to communicate changes from view controller to SwiftUI interface
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        //location and size of the search bar on declaration
        
        searchBar.delegate = context.coordinator
        //delegate of the search bar to modify its behaviour
        
        //MARK: Some examples of Search Bar customisation
        
        searchBar.searchBarStyle = .default
        //search bar style: minimal removes background and gives a cleaner appearance
        searchBar.autocapitalizationType = .sentences
        /*
         autocapitalization settings:
         .sentences
         .words
         .none
         */
        searchBar.placeholder = placeholder
        //text displayed on top of the search bar
        searchBar.prompt = prompt
        //line of text to be displayed on top of the search bar
        
        //MARK: All of the following customisations are declared optional so they will be set as default if not specified into the search bar call
        
        if let barcolor = barColor {
        searchBar.barTintColor = barcolor
        }
        //tint color of the bar's background, no effect if searchBarStyle is minimal
        
        if let tintcolor = elementColor {
        searchBar.tintColor = tintcolor
        }
        //tint color of the bar's main element
        
        if let searchicon = searchIcon {
        searchBar.setImage(searchicon, for: .search, state: .normal)
        }
        //change the search bar icon
        
        if let image = backgroundImage {
            let resizedImage = image.resized(to: CGSize(width: 600, height: 35))
            let roundedImage = resizedImage.round(100)
            
            searchBar.setSearchFieldBackgroundImage(roundedImage, for: .normal)
        }
        
        //sets a background image for the search field
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = searchFieldColor
        }
        //sets search bar textfield colour
        
        if let textfieldText = searchBar.value(forKey: "searchField") as? UITextField {
            textfieldText.textColor = searchTextColor
        }
        //sets typing text colour
        
        if let textfieldPlaceholder = searchBar.value(forKey: "searchField") as? UITextField {
            textfieldPlaceholder.attributedPlaceholder = NSAttributedString(string: textfieldPlaceholder.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor as Any])
        }
        //sets placeholder text colour, it needs to access the UITextField of the searchBar
        
        return searchBar
        
    }//initial state of the view
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }//updated state of the view when text changes
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), placeholder: "Search...", prompt: "", elementColor: .green, barColor: .red, searchFieldColor: .yellow, searchTextColor: .black, backgroundImage: UIImage(named: "Untitled 2.png")!, searchIcon: UIImage(systemName: "arrow.up.circle.fill")!)
    }
}
