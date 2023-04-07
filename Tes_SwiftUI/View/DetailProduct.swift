//
//  DetailProduct.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 07/04/2566 BE.
//

import SwiftUI

struct DetailProduct: View {
    var product: Product
    @State var select = 0
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            Text(product.title)
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .opacity(0.75)
            
            ZStack{
                AsyncImage(url: URL(string: product.images[select])) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }
                VStack{
                    HStack{
                        Text("\(select+1) / \(product.images.count)")
                            .padding(.vertical, 3)
                            .padding(.horizontal)
                            .background(Color(.systemGray5).opacity(0.7))
                            .cornerRadius(12)
                            .padding()
                        Spacer()
                    }
                    Spacer()
                }
            }.padding(.vertical)
            
            HorizontalImagePicker(images: product.images, selectedImageIndex: $select).padding(.bottom, 20)
            
            VStack {
                Text("Harga: ")
                + Text("\(String(format: "%.2f", Double(product.price)))$ ").strikethrough()
                + Text("  \(String(format: "%.2f", Double(product.price) - product.discountPercentage))$").bold()
            }.padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            .padding(.top, 60)
            .font(Font.system(size:24))
            .foregroundColor(.blue)
            .bold()
            .lineLimit(2)
            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            
            VStack(alignment: .leading) {
                Text("⭐️:  \(String(format: "%.1f", product.rating))")
                    .font(Font.system(size:16))
                    .foregroundColor(.blue)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                Text("Stok: \(product.stock)")
                Text("Categori: \(product.category)")
                Text("Brand: \(product.brand)")
                Text(" \(product.description)")
                    .padding(10)
                        .padding(.vertical, 30)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding()
            
            Spacer().frame(height: 60)
        }
    }
}
struct HorizontalImagePicker: View {
    let images: [String]
    @Binding var selectedImageIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(images.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: images[index])) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedImageIndex == index ? Color.blue : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedImageIndex = index
                    }
                }
            }
        }
    }
}

struct HorizontalImagePicker_Previews: PreviewProvider {
    @State static var select = 1
    static var previews: some View {
        HorizontalImagePicker(images: ["https://i.dummyjson.com/data/products/4/1.jpg","https://i.dummyjson.com/data/products/4/2.jpg","https://i.dummyjson.com/data/products/4/3.jpg","https://i.dummyjson.com/data/products/4/4.jpg","https://i.dummyjson.com/data/products/4/thumbnail.jpg"], selectedImageIndex: $select)
    }
}
struct DetailProduct_Previews: PreviewProvider {
    static var previews: some View {
        DetailProduct(product: Product(id: 12, title: "OPPOF19", description: "OPPO F19 is officially announced on April 2021.", price: 280, discountPercentage: 17.91, rating: 4.5, stock: 123, brand: "Samsung", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/4/thumbnail.jpg", images: [
            "https://i.dummyjson.com/data/products/4/1.jpg",
            "https://i.dummyjson.com/data/products/4/2.jpg",
            "https://i.dummyjson.com/data/products/4/3.jpg",
            "https://i.dummyjson.com/data/products/4/4.jpg",
            "https://i.dummyjson.com/data/products/4/thumbnail.jpg"
         ]))
    }
}

