//
//  ViewController.swift
//  where-am-i
//
//  Created by Fernando Moreira on 05/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var localizationManager = CLLocationManager()
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localizationManager.delegate = self
        localizationManager.desiredAccuracy = kCLLocationAccuracyBest
        localizationManager.requestWhenInUseAuthorization()
        localizationManager.startUpdatingLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Keeps updating user location whenever he moves
        
        let userLocation = locations.last!
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        self.latitudeLabel.text = String(latitude)
        self.longitudeLabel.text = String(longitude)
        
        if userLocation.speed > 0 {
            speedLabel.text = String(userLocation.speed)
        }
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let localization: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let displayArea: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: localization, span: displayArea)
        map.setRegion(region, animated: true)
        
        // How to retrieve the address from latitude and longitude:
        CLGeocoder().reverseGeocodeLocation(userLocation) { (locationDetails, erro) in
            
            if erro == nil {
                
                if let locationData = locationDetails?.first {
                
                    var thoroughfare = ""
                    if locationData.thoroughfare != nil {
                        thoroughfare = locationData.thoroughfare!
                    }
                    
                    var subThoroughfare = ""
                    if locationData.subThoroughfare != nil {
                        subThoroughfare = locationData.subThoroughfare!
                    }
                    
                    var locality = ""
                    if locationData.locality != nil {
                        locality = locationData.locality!
                    }
                    
                    var country = ""
                    if locationData.country != nil {
                        country = locationData.country!
                    }
                    
                    self.addressLabel.text = thoroughfare + " - "
                                            + subThoroughfare + " | "
                                            + locality + " - "
                                            + country
                
                }
            } else {
                
                print(erro ?? "Erro ao encontrar localização")
                
            }
            
        }
        
    }
    
    // Treats the case when the user does not authorize using its location (In this case, it should open settings and in there, he can authorizes:
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse {
            
            let alertController = UIAlertController(title: "Permissão de Localização", message: "Necessário permissão para acesso à localização! Por favor, habilite.", preferredStyle: .alert)
            
            let settingsAction = UIAlertAction(title: "Abrir configurações", style: .default, handler: { (alertSettings) in
                
                if let settings = NSURL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settings as URL)
                }
                
            })
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertController.addAction(settingsAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
    }


}

