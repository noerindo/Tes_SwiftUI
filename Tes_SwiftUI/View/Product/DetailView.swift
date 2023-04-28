//
//  DetailView.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 28/04/2566 BE.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @StateObject var detailVM : ProducDetailViewModel = ProducDetailViewModel()
    @State var select = 0
    var product : Product
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                
                
                ZStack{
                    AsyncImage(url: URL(string: product.images[select])) { image in
                        image.image?
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                            .cornerRadius(12)
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
                
                Text(product.title)
                    .font(Font.system(size:24))
                    .foregroundColor(.blue)
                    .bold()
                    .lineLimit(2)
                
                Text("\(product.brand)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)
                
                VStack(alignment: .center){
                    HStack{
                        Image(systemName: "folder.fill")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("\(product.stock)")
                            .font(Font.system(size:16))
                            .foregroundColor(.blue)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        Text("⭐️")
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("Rating : \(String(product.rating)) / 5.0")
                            .font(Font.system(size:16))
                            .foregroundColor(.blue)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        
                    }
                    HStack{
                        Text("USD : \(String(product.price))")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("Disc for \(String(product.discountPercentage))%")
                            .font(.body)
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                    }
                    
                }
                VStack(alignment: .leading){

                    Text("\(product.description.replacingOccurrences(of: "\r\n", with:"" ))")
                        .multilineTextAlignment(.leading)
                        .font(Font.system(size:18))
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                }
        }

            Button(detailVM.checkFavoriteProduct(id: product.id) ?  "Remove" : "Save") {
                if detailVM.isFavoriteProduct {
                    detailVM.deleteFavorite(id: product.id)
                    print("Removed")
                } else {
                    detailVM.addFavorite(id: product.id)
                    print("Save")
                }
            }
            .frame(width: screenWidth * 0.7)
            .foregroundColor(.white)
            .tint(Color.blue)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .padding(.bottom)
            
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

