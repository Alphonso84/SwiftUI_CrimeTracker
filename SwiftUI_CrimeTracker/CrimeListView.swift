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
   // @Binding var region: MKCoordinateRegion
    @Binding var coordinate: CLLocationCoordinate2D
    @Binding var region: MKCoordinateRegion
    var body: some View {
        VStack {
           
            Map(coordinateRegion: $region).edgesIgnoringSafeArea(.top)
        
            Text("\(city)")
                .font(.title)
                .bold()
            
        }
        
    }
    
}



struct CrimeListView_Previews: PreviewProvider {
    static var previews: some View {
        CrimeListView(city: .constant(""), coordinate: .constant(CLLocationCoordinate2D()), region: .constant(MKCoordinateRegion()))
    }
}


//
