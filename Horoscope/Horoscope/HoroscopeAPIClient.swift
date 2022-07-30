//
//  HoroscopeAPIClient.swift
//  HoroscopeApp
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 28.07.2022.
//

import Foundation


class HoroscopeAPIClient: NSObject, ObservableObject {
    @Published var horoscopeObj : HoroscopeModel? = nil
    @Published var isLoading : Bool = false
    @Published var errorMessage : String? = nil
    var horoscope: String
    
    init(horoscope: String) {
        self.horoscope = horoscope
    }
    
    func fetchHoroscope() async {
        
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let headers = [
            "X-RapidAPI-Key": "7fa8b871b3msh1d9ed86494867edp1a88c2jsnb4af7c14c83d",
            "X-RapidAPI-Host": "sameer-kumar-aztro-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=\(self.horoscope)&day=today")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
            }
            
            let decoder = JSONDecoder()
            let newData = try? decoder.decode(HoroscopeModel.self, from: data ?? Data())
            guard let newData = newData else {
                print ("json error")
                return
            }
            DispatchQueue.main.async {
                self.horoscopeObj = newData
                self.isLoading = false
            }
        })

        dataTask.resume()
        
    }
}
