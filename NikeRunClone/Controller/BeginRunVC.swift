//
//  FirstViewController.swift
//  NikeRunClone
//
//  Created by Roman Tuzhilkin on 8/14/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit
import MapKit

class BeginRunVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthStatus()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .fitness
        
        mapView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }

    @IBAction func startRubBtnPressed(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        guard let onRunVC = storyboard?.instantiateViewController(withIdentifier: CONSTANTS.instance.onRunVCIdentifier) else { return }
        onRunVC.modalPresentationStyle = .fullScreen
        present(onRunVC, animated: false, completion: nil)
    }
    
    @IBAction func centerMapBtnPressed(_ sender: Any) {
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
}

//Extension for location configurations and manipulating
extension BeginRunVC: CLLocationManagerDelegate {
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            checkLocationAuthStatus()
            mapView.showsUserLocation = true
            mapView.setUserTrackingMode(.follow, animated: true)
        } else {
            return
        }
    }
}
