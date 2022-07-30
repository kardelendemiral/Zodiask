//
//  ContentView.swift
//  Horoscope
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 28.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let horoscopes = ["aries", "taurus", "gemini", "cancer", "leo",
                          "virgo", "libra", "scorpio", "sagittarius",
                          "capricorn", "aquarius", "pisces"]
        let columns =  [ GridItem(.adaptive(minimum: 150)) ]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(horoscopes, id: \.self) { horoscope in
                        NavigationLink {
                            HoroscopeView(horoscope: horoscope, client: HoroscopeAPIClient(horoscope: horoscope))
                        } label: {
                            VStack {
                                Image("\(horoscope)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180, height: 180)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        //.clipShape(RoundedRectangle(cornerRadius: 10))
                        //.overlay(RoundedRectangle(cornerRadius: 10).stroke(.black))
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("ZODIASK")
            .background(Color(red: 0.996, green: 0.8164, blue: 0.859375))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
