//
//  CrimePickerView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/29/20.
//

import SwiftUI
/*
 CRIMEPICKERVIEW IS USED IN MAIN CONTENTVIEW
 */
struct CrimePickerView: View {
    
    @Binding var city:String
    
    var body: some View {
       
        Picker("City", selection: $city) {
            ForEach(City.allCases) { city in
                Text(city.rawValue)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width:1,alignment:.bottom)
    }
}

struct CrimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CrimePickerView(city:.constant(""))
    }
}
