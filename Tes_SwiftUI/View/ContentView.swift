//
//  ContentView.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 07/04/2566 BE.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView{
            TabView {
                ListProduct()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Produc")
                }
                ListProduct()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                }
            }
        }
    }
}
struct  ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

