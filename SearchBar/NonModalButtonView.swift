//
//  NonModalButtonView.swift
//  Frontend
//
//  Created by Luigi Luca Coletta on 22/03/22.
//

import SwiftUI

struct NonModalButtonView: UIViewRepresentable {
   //to integrate UI stuff into SwiftUI
    
    func makeUIView(context: Context) -> UIButton {
        
        let button = UIButton(type: .system)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 100, weight: .medium, scale: .default)
        let image = UIImage(systemName: "arrow.up.circle.fill", withConfiguration: imageConfiguration)
        
        
        button.setImage(image, for: .normal)
        button.tintColor = .red
        
        let storyboard = UIStoryboard(name: "Storyboard", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "VC")
        
        //access to the viewController
        
        let action = UIAction { _ in
            
            button.window?.rootViewController?.present(viewController, animated: true)
        }
        
        //sets up an animated action for the button
        
        button.addAction(action, for: .touchUpInside)
        
        //adds an action for the button (sheet view)
        
        return button
    } //to visualise the button
    
    func updateUIView(_ uiView: UIButton, context: Context) {
//        no code needed because the view will never be updated
    }
    
    typealias UIViewType = UIButton //new typename for an existing type
    
}

struct NonModalButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NonModalButtonView()
    }
}
