//
//  ListProduct.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 07/04/2566 BE.
//

import SwiftUI

struct ListProduct: View {
    var categories = ["smartphones","laptops","fragrances","skincare","groceries","home-decoration","furniture"]
    
    @State var categ = "all"
    @State var posts = [Product]()
    //Fullscreen
    @State var product = Product(id: 1, title: "", description: "", price: 1, discountPercentage: 1.1, rating: 1.1, stock: 1, brand: "", category: "", thumbnail: "", images: ["https://i.dummyjson.com/data/products/4/3.jpg","https://i.dummyjson.com/data/products/4/4.jpg"])
    
    @State var isFullScreen = false
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(posts, id: \.id) { post in
                    if post.category == categ || categ == "all"{
                        HStack() {
                            NavigationLink {
                                DetailProduct(product: post)
                            } label: {
                                AsyncImage(url: URL(string: post.thumbnail)) { image in
                                    
                                        Text(post.title)
                                        .font(Font.system(size:25))
                                    HStack{
                                        Text("⭐️:\(post.rating)")
                                        Text("Stock:\(post.stock)")
                                    }.foregroundColor(.black)
                                       
                                    image.padding()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
            }.onAppear {
                ServiceAPI.shared.fetchData { result in
                    switch result{
                    case .success(let data):
                        posts = data.products
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            .navigationBarTitle(Text("List of Product"),displayMode: .inline)
            .navigationBarItems(trailing:  Picker("Categori: ", selection: $categ) {
                Text("Categori").tag("all")
                ForEach(categories, id: \.self) { cat in
                    Text(cat).tag(cat)
                }
            })
        }
    }
}

struct ListProduct_Previews: PreviewProvider {
    static var previews: some View {
        ListProduct()
    }
}

