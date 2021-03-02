//
//  SneakerOfferDetailView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 07.01.21.
//

import SwiftUI

struct SneakerOfferDetailView: View {
    @EnvironmentObject var chatService: ChatService
    @ObservedObject var viewModel: SneakerOfferDetailViewModel = SneakerOfferDetailViewModel()
    var offer: Offer
    var body: some View {
        ScrollView{
            if(!viewModel.jumpToChat){
                Image("default-sneaker")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: 150)
                Group{
                    HStack{
                        Text(offer.name)
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack{
                        Text("\(offer.price, specifier: "%.2f") $")
                            .fontWeight(.semibold)
                            .font(.system(size:20))
                            .foregroundColor(DESIGN.COLOR.darkPurple)
                        Spacer()
                    }.padding(.bottom,5)
                    
                    HStack{
                        Image(systemName: "mappin.circle.fill")
                        Text(offer.city.cityName)
                            .font(.system(size:15))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "timer")
                        Text(offer.created)
                            .font(.system(size:15))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }.padding(.horizontal,10)
                Divider().background(Color.gray)
                Group{
                    HStack{
                        Text("Details")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }.padding(.bottom,5)
                    HStack{
                        Text("Brand:")
                        Text(offer.brand)
                        Spacer()
                    }
                    HStack{
                        Text("Condition:")
                        Text(offer.condition)
                        Spacer()
                    }
                    HStack{
                        Text("Size:")
                        Text("\(offer.size, specifier: "%.1f")")
                        Spacer()
                    }
                }.padding(.horizontal,10)
                Divider().background(Color.gray)
                Group{
                    HStack{
                        Text("Description")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }.padding(.bottom,5)
                    HStack{
                        Text(offer.offerDescription)
                        Spacer()
                    }
                }.padding(.horizontal,10)
                Divider().background(Color.gray)
                Group{
                    HStack{
                        Text("Seller")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }.padding(.bottom,5)
                    HStack{
                        Text(offer.ownerName)
                        Spacer()
                        Button(action: {
                            viewModel.chatWithOwner(ownerName: offer.ownerName, ownerID: offer.ownerID)
                        }){
                            Text("Chat with Owner")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 180, height: .infinity)
                                .background(DESIGN.COLOR.darkPurple)
                                .cornerRadius(35.0)
                        }
                    }
                }.padding(.horizontal,10)
                Divider().background(Color.gray)
                Group{
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                    OfferMapView()
                        .frame(width: .infinity, height: 200)
                }
            }else{
                NavigationLink("toChatView", destination: ChatView(chatID: viewModel.chatID, chatPartner: offer.ownerName).environmentObject(self.chatService), isActive: $viewModel.jumpToChat)
            }
        }.onAppear{
            viewModel.setChatService(chatService: self.chatService)
        }
    }
}

struct SneakerOfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SneakerOfferDetailView(offer: Offer(id: "123123", name: "Test Sneaker", offerDescription: "testi description", price: 30, size: 8, brand: "Nike", condition: "new", ownerName: "Hoang", ownerID: "12345", city: City(id: "asdasda", latitude: 8.6, longitude: 9.0, cityName: "Wiesbaden"), created: "2021-01-06T19:22:16.459Z", v: 0))
    }
}
