//
//  SwiftUIView.swift
//  
//
//  Created by Mitch Toutain on 2021-10-28.
//

import SwiftUI

struct CountryPickerTest: View {
    @State private var selectedCountry: Country? = nil
    
    var body: some View {
        CountryPicker(selectedCountry: $selectedCountry)
    }
}

struct CountryPickerTest_Previews: PreviewProvider {
    static var previews: some View {
        CountryPickerTest()
    }
}
