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
    
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

