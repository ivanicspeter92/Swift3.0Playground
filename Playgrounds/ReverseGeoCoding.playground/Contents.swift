import UIKit
import MapKit

func setUsersClosestCity()
{
    let geoCoder = CLGeocoder()
    let point = Coordinates(longitude: 60.208445, latitute: 24.966967)
    let location = CLLocation(latitude: point.latitude, longitude: point.longitude)
    geoCoder.reverseGeocodeLocation(location)
    {
        (placemarks, error) -> Void in
        
        let placeArray = placemarks as [CLPlacemark]!
        
        // Place details
        var placeMark: CLPlacemark!
        placeMark = placeArray?[0]
        
        // Address dictionary
        print(placeMark.addressDictionary)
        
        // Location name
        if let locationName = placeMark.addressDictionary?["Name"] as? NSString
        {
            print(locationName)
        }
        
        // Street address
        if let street = placeMark.addressDictionary?["Thoroughfare"] as? NSString
        {
            print(street)
        }
        
        // City
        if let city = placeMark.addressDictionary?["City"] as? NSString
        {
            print(city)
        }
        
        // Zip code
        if let zip = placeMark.addressDictionary?["ZIP"] as? NSString
        {
            print(zip)
        }
        
        // Country
        if let country = placeMark.addressDictionary?["Country"] as? NSString
        {
            print(country)
        }
    }
}

setUsersClosestCity()
