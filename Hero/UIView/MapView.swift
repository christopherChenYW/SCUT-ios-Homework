//
//  MapView.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/8.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    let center:CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {

        uiView.setRegion(MKCoordinateRegion(center:center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)), animated: true)
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(center: CLLocationCoordinate2D(latitude: 39.90, longitude: 116.3952))
    }
}
