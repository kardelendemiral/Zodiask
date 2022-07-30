//
//  HoroscopeView.swift
//  Horoscope
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 28.07.2022.
//

import SwiftUI

struct HoroscopeView: View {
    var horoscope: String
    @StateObject var client : HoroscopeAPIClient
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("\(horoscope)")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width)
                        .padding(.top)
                    
                    VStack(alignment: .center) {
                        Group {
                            Text(client.horoscopeObj?.date_range ?? "").italic()
                            Divider()
                        }
                        Group {
                            Text("Color")
                                .bold()
                                .foregroundColor(Color(red:0.90234375, green:0.328125, blue:0.5))
                            Text(client.horoscopeObj?.color ?? "")
                            Divider()
                        }
                        Group {
                            Text("Best Partner")
                                .bold()
                                .foregroundColor(Color(red:0.90234375, green:0.328125, blue:0.5))
                            Text(client.horoscopeObj?.compatibility ?? "")
                            Divider()
                        }
                        Group {
                            Text("Lucky Time")
                                .bold()
                                .foregroundColor(Color(red:0.90234375, green:0.328125, blue:0.5))
                            Text(client.horoscopeObj?.lucky_time ?? "")
                            Divider()
                        }
                        Group {
                            Text("Lucky Number")
                                .bold()                              .foregroundColor(Color(red:0.90234375, green:0.328125, blue:0.5))
                            Text(client.horoscopeObj?.lucky_number ?? "")
                            Divider()

                        }
                        Group {
                            Text("Mood")
                                .bold()
                                .foregroundColor(Color(red:0.90234375, green:0.328125, blue:0.5))
                            Text(client.horoscopeObj?.mood ?? "")
                            Divider()
                        }
                        Group {
                            Text("Daily Horoscope")
                                .bold()
                                .foregroundColor(Color(red:0.90234375, green:0.328125, blue:0.5))

                            Text(client.horoscopeObj?.description ?? "")
                            Divider()
                        }
                    }.padding(.horizontal)
                   
                }
                .padding(.bottom)
                .onAppear {
                    Task {
                        await client.fetchHoroscope()
                    }
                }
                .navigationTitle(self.horoscope.uppercased())
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .background(Color(red: 0.996, green: 0.8164, blue: 0.859375))
    }
    
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView(horoscope: "libra", client: HoroscopeAPIClient(horoscope: "libra"))
    }
}
