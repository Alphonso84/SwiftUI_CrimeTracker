//
//  CrimeListView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/28/20.
//

import MapKit
import SwiftUI


struct CrimeListMapView: View {
    
    @Binding var city: String
    @Binding var coordinate: CLLocationCoordinate2D
    @Binding var region: MKCoordinateRegion
    @Binding var crimes: [Feature]
    var body: some View {
        VStack {
           
            Map(coordinateRegion: $region).edgesIgnoringSafeArea(.top)
            
            List(crimes, id: \.id) { item in
                Text("\(item.attributes.crimeDescription)")
                
            }
            Text("\(city)")
                .font(.title)
                .bold()
            
        }
        
    }
    
}



struct CrimeListView_Previews: PreviewProvider {
    static var previews: some View {
        CrimeListMapView(city: .constant("Oakland"), coordinate: .constant(CLLocationCoordinate2D()), region: .constant(MKCoordinateRegion()), crimes: .constant([Feature]()))
    }
}


//
