//
//  MapViewController.swift
//  Project
//
//  Created by Ghost on 19.03.23.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet
    private var settingsButton: UIButton!

    @IBOutlet
    private var map: MKMapView!
    
    private let annotation = MKPointAnnotation()
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        addPin(latitude: 53.899869, longitude: 27.434155)
        addPin(latitude: 53.887040, longitude: 27.422926)
        addPin(latitude: 53.905862, longitude: 27.445922)
        addPin(latitude: 53.906993, longitude: 27.473668)
        addPin(latitude: 53.905772, longitude: 27.480874)
        addPin(latitude: 53.918381, longitude: 27.450503)
        addPin(latitude: 53.927872, longitude: 27.432752)
        
        map.delegate = self
        
        settingsButton.setTitle(L10n.GoToSetting.Button.title, for: .normal)
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: 11.12, longitude: 12.11)
        map.addAnnotation(annotation)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTapHandler))
        map.addGestureRecognizer(tapGesture)
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if [.authorizedWhenInUse, .authorizedAlways]
            .contains(locationManager.authorizationStatus) {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    @objc
    func oneTapHandler(_ sender: UITapGestureRecognizer) {
    
            let location = sender.location(in: map)
            let coordinate = map.convert(location,toCoordinateFrom: map)

            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate

            if map.annotations.count == 1 {
                map.removeAnnotation(map.annotations.last!)
            }
            map.addAnnotation(annotation)
        }
    
    @IBAction
    func openSettingsButtonTapped(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    private func addPin(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        pin.title = "Beer"
        pin.subtitle = "drink time"
        map.addAnnotation(pin)
    }
    
    private func updateLocationPermissions() {
        settingsButton.isHidden = true

        switch locationManager.accuracyAuthorization {
        case .reducedAccuracy:
            print("reduced accuracy")
        case .fullAccuracy:
            fallthrough
        @unknown default:
            print("full or unknown")
            break
        }

        switch locationManager.authorizationStatus {
        case .denied:
            settingsButton.isHidden = false
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
            fallthrough
        case .authorizedAlways:
            fallthrough
        @unknown default:
            locationManager.startUpdatingLocation()
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            map.setRegion(region, animated: true)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        updateLocationPermissions()
    }
}

extension MapViewController: MKMapViewDelegate {
    internal func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        annotationView?.image = UIImage(named: "Icon/Beer")

        return annotationView
    }

}

