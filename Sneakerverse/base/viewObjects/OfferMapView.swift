//
//  DetailsMapView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 09.01.21.
//

import SwiftUI
import MapKit
import Combine

struct PinAnnotation: Identifiable, Decodable{
    var id = UUID()
    let latitude: Double
    let longitude: Double
    
    private enum CoddingKeys: CodingKey{
        case latitude
        case longitude
    }
}

struct OfferMapView: View {
    @ObservedObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion.defaultRegion
    @State private var cancellable: AnyCancellable?
    @State private var annotations = [PinAnnotation]()
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
        }
    }
    
    
    var body: some View {
        VStack{
            if locationManager.location != nil{
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: annotations) { annotation in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude)) {
                        Image(systemName:"mappin")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                    }
                }
            }
            else{
                Text("Locating user location...")
            }
        }
        .onAppear{
            setCurrentLocation()
        }
    }
}

struct OfferMapView_Previews: PreviewProvider {
    static var previews: some View {
        OfferMapView()
    }
}
