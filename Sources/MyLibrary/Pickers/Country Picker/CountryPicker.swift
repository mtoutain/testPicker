//
//  SwiftUIView.swift
//  
//
//  Created by Mitch Toutain on 2021-10-19.
//

import SwiftUI

public struct CountryPicker: View {
    
    @Binding var selectedCountry: Country?
    @State private var pickerIsShowing: Bool = false
    
    public init(selectedCountry: Binding<Country?>) {
        self._selectedCountry = selectedCountry
    }
    
    public var body: some View {
        
        HStack {
            Text("Country")
            Spacer()
            HStack {
            Text(selectedCountry != nil ? selectedCountry!.countryName : "Select")
            Image(systemName: "chevron.right")
                .font(Font.footnote.bold())
            }
            .foregroundColor(Color(.secondaryLabel))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.pickerIsShowing.toggle()
        }
        .sheet(isPresented: $pickerIsShowing) {
            CountryPickerModal(selectedCountry: $selectedCountry)
        }
    }
}

public struct CountryDialCodePicker: View {
    
    @Binding var selectedCountry: Country?
    @State private var pickerIsShowing: Bool = false
    
   public var body: some View {
    
            HStack {
                HStack {
                    Text(selectedCountry != nil ? "+\(selectedCountry!.dialingCode)" : "+\(Country.currentLocaleCountry.dialingCode)")
                    Text(selectedCountry != nil ? "(\(selectedCountry!.countryName))" : "(\(Country.currentLocaleCountry.countryName))")
                }
                
            
                Image(systemName: "chevron.right")
                    .font(Font.footnote.bold())
            }
            .foregroundColor(.accentColor)
            .contentShape(Rectangle())
            .onTapGesture {
                self.pickerIsShowing.toggle()
            }
            .sheet(isPresented: $pickerIsShowing) {
                CountryPickerModal(selectedCountry: $selectedCountry, displayForDialCode: true)
            }
        
        
    }
    
    
}

struct CountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CountryDialCodePicker(selectedCountry: .constant(.canada))
    }
}

public struct CountryPickerModal: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedCountry: Country?
    
    var countries = Country.allCountries
    var sectionHeaders = Country.countryListSectionHeader
    var displayForDialCode: Bool = false
    
    public var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { scrollProxy in
                    ZStack {
                        // MARK: - List
                        List {
                            ForEach(sectionHeaders) { letter in
                                Section(header: Text(letter.value).id(letter.id)) {
                                    ForEach(countries.filter({(country) -> Bool in country.countryName.prefix(1) == letter.value})) { country in
                                        
                                        
                                        Button(action: {
                                            self.selectedCountry = country
                                            self.presentationMode.wrappedValue.dismiss()
                                        }) {
                                            HStack {
                                                Image(systemName: "checkmark")
                                                    .font(Font.body.bold())
                                                    //                                                    .foregroundColor(Color("AccentColor"))
                                                    .opacity(selectedCountry == country ? 1 : 0)
                                                
                                                if displayForDialCode {
                                                    Text("+\(country.dialingCode)")
                                                }
                                                Text(displayForDialCode ? "(\(country.countryName))" : "\(country.countryName)")
                                                
                                            }
                                            .foregroundColor(selectedCountry == country ? Color("AccentColor") : Color(.label))
                                            .contentShape(Rectangle())
                                        }
                                        .id(country)
                                        
                                    }
                                }
                            }
                        }
                        .navigationBarTitle("Country or Region", displayMode: .inline)
                        .listStyle(PlainListStyle())
                        .navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                            Text("Cancel")
                        })
                        .onAppear() {
                            print(selectedCountry)
                            if selectedCountry != nil {
                                scrollProxy.scrollTo(selectedCountry, anchor: .center)
                            }
                        }
                        
                        // MARK: - Side Index
                        
                        VStack {
                            ForEach(Alphabet.letters) { letter in
                                HStack {
                                    Spacer()
                                    
                                    Button(action : {
                                        // need to figure out if there is a country in this section before scrollto or it will crash
                                        // if selecting a section that is empty scroll to the next section
                                        
                                        if sectionHeaders.first(where: {$0.value == letter.value}) != nil {
                                            scrollProxy.scrollTo(letter.id, anchor: .top)
                                        } else if let approximateId = findBestApproximateHeaderToScroll(letter: letter) {
                                            scrollProxy.scrollTo(approximateId, anchor: .center)
                                        } else {
                                            scrollProxy.scrollTo(sectionHeaders.last?.id, anchor: .top)
                                        }
                                        
                                    }) {
                                        Text(letter.value)
                                            .font(.footnote)
                                            .frame(width: 25, alignment: .center)
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    func findBestApproximateHeaderToScroll(letter: Alphabet.Letter) -> Int? {
        
        let sectionToScroll = sectionHeaders.first { header in
            header.value >= letter.value
        }
        
        return sectionToScroll?.id
    }
}

struct CountryPickerLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(CountryPicker(selectedCountry: .constant(Country.canada)),title: "CountryPicker", category: .control)
    }
}
