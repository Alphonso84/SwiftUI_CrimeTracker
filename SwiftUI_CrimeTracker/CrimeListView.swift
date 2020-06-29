//
//  CrimeListView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/28/20.
//

import SwiftUI

struct CrimeListView: View {
    
    @Binding var city: String
    var body: some View {
       
        Text("\(city)")
            .font(.title)
            .bold()
            
        
    }
}

struct CrimeListView_Previews: PreviewProvider {
    static var previews: some View {
        CrimeListView(city: .constant(""))
    }
}
