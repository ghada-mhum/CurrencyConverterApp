//
//  ContentView.swift
//  CurrencyConverterApp
//
//  Created by ghada Mohammad on 30/04/1445 AH.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.darkGreen
                .ignoresSafeArea()
            VStack {
                Image("img")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350,height: 350)
                Text("Currency Converter")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                
                Button(action: {
                    ConverterView()
                    
                }, label: {
                    Text("Get Started")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0)
                            .fill(.white.opacity(0.5)
                                )
                                .frame(width: 350)
                        )
                }).padding()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
