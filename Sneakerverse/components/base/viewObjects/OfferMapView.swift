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
    @State var coordinateRegion: CLLocationCoordinate2D
    @State var coordinate: [PinAnnotation]
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(center: coordinateRegion, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }
    }
    
    
    var body: some View {
        VStack{
            if locationManager.location != nil{
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: coordinate) { annotation in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude)) {
                        Image(systemName:"mappin")
                            .resizable()
                            .frame(width: 10, height: 25)
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
        OfferMapView(coordinateRegion: CLLocationCoordinate2D(latitude: 2.0, longitude: 3.0), coordinate: [PinAnnotation(latitude: 9.0, longitude: 3.0)])
    }
}
