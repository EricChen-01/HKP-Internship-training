//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Eric Chen on 1/2/21.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown"
        }
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown"
        }
        set {
            subtitle = newValue
        }
    }
}
