//
//  ContentView.swift
//  Weather
//
//  Created by Tutku BİDE on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    //VStack
    //HStack
    //ZStack
    //LazyVStack
    //LazyHStack
    
    @State var darkMode = false
    
    var body: some View {
        ZStack {
            BackgroundView(darkMode: $darkMode)
            VStack {
                CityTitleView()
                TodayView()
                ScrollView(.horizontal) {
                    HStack {
                        DaysView(title: "pzts", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "slı", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "çrş", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "prş", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "pzts", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "pzts", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "pzts", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "pzts", image: "sun.haze.fill", temp: 15)
                        DaysView(title: "pzts", image: "sun.haze.fill", temp: 15)
                    }
                }
    
                Spacer()
                ModeButtonView(buttonChanged: $darkMode)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    
    @Binding var darkMode: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [darkMode ? .black : .blue, darkMode ? .gray :.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTitleView: View {
    var body: some View {
        Text("İstanbul")
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct DaysView: View {
    
    var title: String
    var image: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .font(.system(size: 20))
                .padding()
            
            Image(systemName: image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .font(.system(size: 20))
        }
    }
}

struct TodayView: View {
    var body: some View {
        VStack {
            
            
            Image(systemName: "sun.haze.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            Text("23°")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
                .padding(.bottom, 50)
        }
    }
}

struct ModeButtonView: View {
    @Binding var buttonChanged: Bool
    
    var body: some View {
        Button {
            buttonChanged.toggle()
        } label: {
            HStack {
                Image(systemName: "moon.circle.fill")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
            }
        }
    }
}
