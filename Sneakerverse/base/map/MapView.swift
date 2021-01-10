//
//  MapView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 09.01.21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> UIView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
