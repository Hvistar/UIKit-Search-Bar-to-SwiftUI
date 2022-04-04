//
//  SearchBar2.swift

import SwiftUI
import Foundation

struct SearchBar2: UIViewRepresentable {
    //to make UIKit code integrate into SwiftUI
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate{
        
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange
                       searchText: String){
            text = searchText
        }
        
    }
    
    func makeCoordinator() -> SearchBar2.Coordinator {
        return Coordinator(text: self.$text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar2>) -> UISearchBar {
        let searchBar2 = UISearchBar(frame: .zero)
        searchBar2.delegate = context.coordinator
        searchBar2.autocapitalizationType = .words
        searchBar2.placeholder = "Search..."
        
        return searchBar2
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar2>) {
        uiView.text = text
    }
    
}

struct SearchBar2_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar2(text: .constant(""))
    }
}
