//
//  ProductView.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 28/04/2566 BE.
//

import SwiftUI
import CoreData

struct ProductView: View {
    @StateObject var producviewModel : ProducViewModel = .init()
    
    var categories = ["smartphones","laptops","fragrances","skincare","groceries","home-decoration","furniture"]
    
    @State var categ = "all"
    @State var posts = [Product]()
    var body: some View {
        NavigationView {
            if producviewModel.loading {
                LoadingView(color: Color.blue, size: 50)
            } else {
                List{
                    ForEach(producviewModel.allProducts, id: \.self) { product in
                        if product.category == categ || categ == "all"{
                            NavigationLink(destination: DetailView(product: product)) {
                                RowProduct(product: product)
                                
                            }
                            
                        }
                        
                    }
                }
               
            }
        }.navigationBarItems(trailing:  Picker("Categori: ", selection: $categ) {
            Text("Categori").tag("all")
            ForEach(categories, id: \.self) { cat in
                Text(cat).tag(cat)
            }
        })
    }
}

struct RowProduct : View {
    @StateObject var listComponentVM : ListProducViewModel = .init()
    var product : Product
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) {
                image in image.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.4, height: screenHeight * 0.2)
                    .cornerRadius(15)
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text(product.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .lineLimit(2)
                        .font(Font.system(size:15))
                        .padding(.bottom,3)
                        .frame(alignment: .center)
                }
                VStack(alignment: .center) {
                    Text("⭐️ :\(String(product.rating)) / 5.0")
                    Text("Disc \(String(product.discountPercentage)) %")
                        .font(.headline)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
              
                
                
//                if listComponentVM.checkProductFavorite(id: product.id) {
//                    Image(systemName: "heart.fill")
//                        .fontWeight(.bold)
//                        .foregroundColor(.red)
//                }
            }
        }
        .padding(10)
        .frame(width: screenWidth * 0.75, height:  screenHeight * 0.2)
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
