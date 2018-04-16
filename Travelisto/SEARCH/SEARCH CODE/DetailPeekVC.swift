//
//  DetailPeekVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import MapKit


final class destinationAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate : CLLocationCoordinate2D, title : String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
    
}

class DetailPeekVC: UIViewController, MKMapViewDelegate {

    //UI Properties
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var destinationNameLabel: UILabel!
    @IBOutlet weak var destinationCode: UILabel!
    @IBOutlet weak var destinationAddress: UILabel!
    
    var data : Cairport? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMapView.delegate = self 
        detailMapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        guard let lat = data?.lat else {return}
        guard let lon = data?.lon else {return}
        guard let title = data?.name else {return}
        let subtitle = "Airport"
        guard let code = data?.code else {return}
        guard let state = data?.state else {return}
        guard let city = data?.city else {return}
        guard let country = data?.country else {return}
        
        
        let destinationCoordinate = CLLocationCoordinate2D(latitude: Double(lat)! , longitude: Double(lon)!)
        let da = destinationAnnotation(coordinate: destinationCoordinate, title: title, subtitle: subtitle)
        detailMapView.addAnnotation(da)
        
        destinationCode.text = code
        destinationNameLabel.text = title
        destinationAddress.text = "\(city), \(state) \(country)"
        
        
    }

    


}







