//
//  ContentView.swift
//  Tes_SwiftUI
//
//Created by Indah Nurindo on 07/04/2566 BE.
//


import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView{
            TabView {
                ProductView()
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Product")
                    }
                ProductView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favorite")
                    }
                
            }.navigationBarTitle(Text("Product"),displayMode: .inline)
        }
    }
}
struct  ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
