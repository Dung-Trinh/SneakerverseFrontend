//
//  MapCoordinator.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 09.01.21.
//

import Foundation
import MapKit

final class MapCoordinator: NSObject, MKMapViewDelegate {
    
    var control : MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        parent.centerCoordinate = mapView.centerCoordinate
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let view = MKPinAnnotationView( annotation: annotation, reuseIdentifier: nil)
        view.canShowCallout = true
        return view
    }
}
