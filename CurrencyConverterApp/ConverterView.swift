//
//  ConverterView.swift
//  CurrencyConverterApp
//
//  Created by ghada Mohammad on 30/04/1445 AH.
//

import SwiftUI

struct ConverterView: View {
    @State var itemSelected = 0
    @State var itemSelected2 = 1
    @State var amount: String = ""
    let currencies  = ["USD","SR","GBP"]
    var body: some View {
        NavigationStack{
            ZStack{
                Color.darkGreen.opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    Text("Converter")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                  TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                        .padding(.horizontal,20)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 25.0)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.darkGreen)
                            .padding(.horizontal))
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("From :")
                            Picker(selection: $itemSelected, label: Text("From")
                                .font(.title3)
                                .foregroundColor(.black)){
                                    ForEach(0..<3){
                                        index in
                                        Text(self.currencies[index]).tag(index)
                                    }
                                }.frame(width: 100,height: 50,alignment: .leading)
                                .tint(.white)
//                                .background(.white.opacity(0.7))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .frame(width: 160,height: 100)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.darkGreen.opacity(0.3))
                            .stroke(.darkGreen)
                        )
                        .padding(.leading)
                        VStack(alignment: .leading){
                            Text("To :")
                            Picker(selection: $itemSelected2, label: Text("To")
                                .font(.title3)
                                .foregroundColor(.black)){
                                    ForEach(0..<3){
                                        index in
                                        Text(self.currencies[index]).tag(index)
                                    }
                                }.frame(width: 100,height: 50,alignment: .leading)
                                .tint(.white)
//                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }.padding(.vertical)
                            .frame(width: 160,height: 100)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(.darkGreen.opacity(0.3))
                                .stroke(.darkGreen)
                            )
                            .padding(.trailing)
                        
                    }
                    .padding(.vertical)
                    VStack(alignment: .leading){
                        Text("Total converted amount :")
                            .padding(.leading)
                            .padding(.top)
                        Text("\(convert(amount)) \(currencies[itemSelected2])")
                            .frame(maxWidth: .infinity,alignment: .leading)
                           
                            .padding()
                          
                        
                    }  .background(RoundedRectangle(cornerRadius: 20)
                        .fill(.darkGreen.opacity(0.3))
                        .stroke(.darkGreen)
                    )
                    .padding(.horizontal,30)
                       
                    
                    Spacer()
                }
            }
        }
    }
    
    func convert(_ convert: String)-> String{
        var convertion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[itemSelected]
        let to = currencies[itemSelected2]
        
        let srRates = ["USD": 0.27,"SR": 1.0,"GBP":0.21]
        let usdRates = ["USD": 1.0,"SR": 3.75,"GBP":0.80]
        let gbpRates = ["USD": 1.25,"SR": 4.68,"GBP":1.0]
        
        
        switch (selectedCurrency){
        case "USD" :
            convertion = amount * (usdRates[to] ?? 0.0)
        case "SR" :
            convertion = amount * (srRates[to] ?? 0.0)
        case "GBP" :
            convertion = amount * (gbpRates[to] ?? 0.0)
        default:
            "something wrong"
        }
        
        return String(convertion)
    }
    
}

#Preview {
    ConverterView()
}
