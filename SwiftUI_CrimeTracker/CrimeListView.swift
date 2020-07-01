//
//  CrimeListView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/28/20.
//

import MapKit
import SwiftUI


struct CrimeListView: View {
    
    @Binding var city: String
    @Binding var region: MKCoordinateRegion
   
    var body: some View {
        VStack {
           
            Map(coordinateRegion: $region).edgesIgnoringSafeArea(.all)
            
           
            Text("\(city)")
                .font(.title)
                .bold()
            
        }
    }
}


struct CrimeListView_Previews: PreviewProvider {
    static var previews: some View {
        CrimeListView(city: .constant(""), region: .constant(MKCoordinateRegion()))
    }
}


//
