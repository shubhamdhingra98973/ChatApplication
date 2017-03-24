//
//  ExtensionLocation.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 23/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import UIKit
import CoreData

extension ViewControllerChat : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let delta = 0.3
        let location = locations[0]
        var span : MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        span.latitudeDelta = span.latitudeDelta * delta
        span.longitudeDelta = span.longitudeDelta * delta
        lat = String(location.coordinate.latitude)
        long = String(location.coordinate.longitude)
        //print(lat," ",long)
        let myLocation :CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        var region:MKCoordinateRegion = MKCoordinateRegion(center:myLocation,span: span)
        region.span = span
    }
    
    func getURL() -> String
    {
        let mapImageUrl = UrlConstant.mapImageUrl.id
        let latlong = lat+UrlConstant.comma.id+long
        let appendStr = UrlConstant.appendStr1.id+latlong+UrlConstant.appendstr2.id
        let mapUrl  = mapImageUrl + latlong + appendStr + String(api_key)
        return mapUrl
    //    imgSetImage.kf.setImage(with: URL(string:mapUrl))
    }
}
