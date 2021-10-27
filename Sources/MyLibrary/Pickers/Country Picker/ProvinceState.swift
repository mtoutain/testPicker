//
//  File.swift
//  
//
//  Created by Mitch Toutain on 2021-10-19.
//

import Foundation

protocol Searchable: Identifiable {
    var title: String { get }
    var searchTarget: String { get }
}

public struct ProvinceState: Equatable, Hashable, Searchable {
    var title: String {
        return name
    }
    
    var searchTarget: String {
        return name
    }
    
    var id: String {
        return name
    }
    
    let code: Int32
    let name: String
    
    init?(from code: Int32) {
        let found = ProvinceState.allProvincesAndStates.first {
            $0.code == code
        }
        if let provinceState = found {
            self.code = code
            self.name = provinceState.name
        } else {
            return nil
        }
    }
    
    init?(from name: String) {
        let found = ProvinceState.allProvincesAndStates.first {
            $0.name.lowercased() == name.lowercased()
        }
        if let provinceState = found {
            self.code = provinceState.code
            self.name = provinceState.name
        } else {
            return nil
        }
    }
    
    private init(_ code: Int32, _ name: String) {
        self.code = code
        self.name = name
    }
    
    enum Canada {
        //TODO: Proper codes corresponding to provinces
        static let alberta = ProvinceState(1, "Alberta")
        static let britishColumbia = ProvinceState(2, "British Columbia")
        static let manitoba = ProvinceState(3, "Manitoba")
        static let newBrunswick = ProvinceState(4, "New Brunswick")
        static let newfoundlandLabrador = ProvinceState(5, "Newfoundland and Labrador")
        static let novaScotia = ProvinceState(6, "Nova Scotia")
        static let northwestTerritories = ProvinceState(7, "Northwest Territories")
        static let nunavut = ProvinceState(8, "Nunavut")
        static let ontario = ProvinceState(9, "Ontario")
        static let princeEdwardIsland = ProvinceState(10, "Prince Edward Island")
        static let quebec = ProvinceState(11, "Quebec")
        static let saskatchewan = ProvinceState(12, "Saskatchewan")
        static let yukonTerritory = ProvinceState(13, "Yukon Territory")
        
        static let allProvinces: [ProvinceState] = [
                    alberta, britishColumbia, manitoba, newBrunswick, newfoundlandLabrador, novaScotia, northwestTerritories, nunavut, ontario, princeEdwardIsland, quebec, saskatchewan, yukonTerritory
                ]
    }
    
    enum USA {
        //TODO: Proper codes corresponding to states
        static let alaska = ProvinceState(20, "Alaska")
        static let alabama = ProvinceState(21, "Alabama")
        static let arkansas = ProvinceState(22, "Arkansas")
        static let americanSamoa = ProvinceState(23, "American Samoa")
        static let arizona = ProvinceState(24, "Arizona")
        static let california = ProvinceState(25, "California")
        static let colorado = ProvinceState(26, "Colorado")
        static let connecticut = ProvinceState(27, "Connecticut")
        static let districtOfColumbia = ProvinceState(28, "District of Columbia")
        static let delaware = ProvinceState(29, "Delaware")
        static let florida = ProvinceState(30, "Florida")
        static let georgia = ProvinceState(31, "Georgia")
        static let guam = ProvinceState(32, "Guam")
        static let hawaii = ProvinceState(33, "Hawaii")
        static let iowa = ProvinceState(34, "Iowa")
        static let idaho = ProvinceState(35, "Idaho")
        static let illinois = ProvinceState(36, "Illinois")
        static let indiana = ProvinceState(37, "Indiana")
        static let kansas = ProvinceState(38, "Kansas")
        static let kentucky = ProvinceState(39, "Kentucky")
        static let louisiana = ProvinceState(40, "Louisiana")
        static let massachusetts = ProvinceState(41, "Massachusetts")
        static let maryland = ProvinceState(42, "Maryland")
        static let maine = ProvinceState(43, "Maine")
        static let michigan = ProvinceState(44, "Michigan")
        static let minnesota = ProvinceState(45, "Minnesota")
        static let missouri = ProvinceState(46, "Missouri")
        static let mississippi = ProvinceState(47, "Mississippi")
        static let montana = ProvinceState(48, "Montana")
        static let northCarolina = ProvinceState(49, "North Carolina")
        static let northDakota = ProvinceState(50, "North Dakota")
        static let nebraska = ProvinceState(51, "Nebraska")
        static let newHampshire = ProvinceState(52, "New Hampshire")
        static let newJersey = ProvinceState(53, "New Jersey")
        static let newMexico = ProvinceState(54, "New Mexico")
        static let nevada = ProvinceState(55, "Nevada")
        static let newYork = ProvinceState(56, "New York")
        static let ohio = ProvinceState(57, "Ohio")
        static let oklahoma = ProvinceState(58, "Oklahoma")
        static let oregon = ProvinceState(59, "Oregon")
        static let pennsylvania = ProvinceState(60, "Pennsylvania")
        static let puertoRico = ProvinceState(61, "Puerto Rico")
        static let rhodeIsland = ProvinceState(62, "Rhode Island")
        static let southCarolina = ProvinceState(63, "South Carolina")
        static let southDakota = ProvinceState(64, "South Dakota")
        static let tennessee = ProvinceState(65, "Tennessee")
        static let texas = ProvinceState(66, "Texas")
        static let utah = ProvinceState(67, "Utah")
        static let virginia = ProvinceState(68, "Virginia")
        static let virginIslands = ProvinceState(69, "Virgin Islands")
        static let vermont = ProvinceState(70, "Vermont")
        static let washington = ProvinceState(71, "Washington")
        static let wisconsin = ProvinceState(72, "Wisconsin")
        static let westVirginia = ProvinceState(73, "West Virginia")
        static let wyoming = ProvinceState(74, "Wyoming")
        
        static let allStates: [ProvinceState] = [
            alaska, alabama, arkansas, americanSamoa, arizona, california, colorado, connecticut, districtOfColumbia, delaware, florida, georgia, guam, hawaii, iowa, idaho, illinois, indiana, kansas, kentucky, louisiana, massachusetts, maryland, maine, michigan, minnesota, missouri, mississippi, montana, northCarolina, northDakota, nebraska, newHampshire, newJersey, newMexico, nevada, newYork, ohio, oklahoma, oregon, pennsylvania, puertoRico, rhodeIsland, southCarolina, southDakota, tennessee, texas, utah, virginia, virginIslands, vermont, washington, wisconsin, westVirginia, wyoming
                ]
    }

    private static let allProvincesAndStates = [Canada.allProvinces, USA.allStates].flatMap { $0 }

}

