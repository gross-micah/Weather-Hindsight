//
//  ContentView.swift
//  Weather Hindsight
//
//  Created by Micah G on 5/13/20.
//  Copyright © 2020 Micah G. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    @State var city = ""
    @State var temperature = 0
    @State var description = ""
    
    func getWeatherData() {
    let jsonURLString = "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={f61190faee96d569b8739a4b9fb27f2b}"
    // make URL
    guard let url = URL(string: jsonURLString) else { return }
    // create a session
    URLSession.shared.dataTask(with: url) { (data, response, error) in
    // check for error
    if error != nil {
    print(error!.localizedDescription)
    }
    // check for 200 OK status
    guard let data = data else { return }
    do {
    let weather = try JSONDecoder().decode(Weather.self, from: data)
    let url = URL(string: (weather.current?.weather_icons[0]!)!)
    if let data = try? Data(contentsOf: url!) {
    self.imgData = data
    } catch let err {
    print ("Json Err", err)
    }
    // start the session
    }.resume()
    }

    
    var body: some View {
        Text("Weather Hindsight")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Request : Decodable {
    let type : String?
    let query : String?
    let language : String?
    let unit : String?
}

struct Location : Decodable {
    let name : String?
    let country : String?
    let region : String?
    let lat : String?
    let lon : String?
    let timezone_id : String?
    let localtime : String?
    let localtime_epoch : Int?
    let utc_offset : String?
}

struct Current : Decodable {
    let observation_time : String?
    let temperature : Int?
    let weather_code : Int?
    let weather_icons : [String?]
    let weather_descriptions : [String?]
    let wind_speed : Int?
    let wind_degree : Int?
    let wind_dir : String?
    let pressure : Int?
    let precip : Double?
    let humidity : Int?
    let cloudcover : Int?
    let feelslike : Int?
    let uv_index : Int?
    let visibility : Int?
}

struct Weather : Decodable {
    let request : Request?
    let location : Location?
    let current : Current?
}

