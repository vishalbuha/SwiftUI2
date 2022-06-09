//
//  ContentView.swift
//  SwiftUI2
//
//  Created by AkshCom on 31/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Screen(title: "Home", text: "First Screen", imagename: "house", color: Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct Screen: View {
    
    var title: String
    var text: String
    var imagename: String
    var color: Color
    
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: imagename)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding()
                Text(text)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                NavigationLink(
                    destination: SecondScreen(),
                    label: {
                        ContinueButton(color: color, title: "Continue")
                    })
            }
            .navigationTitle(title)
        }
    }
}

struct ContinueButton: View {
    var color: Color
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: 100, height: 35, alignment: .center)
            .background(color)
            .foregroundColor(Color.white)
            .cornerRadius(8)
            .padding(.top)
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
            VStack {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 100/*@END_MENU_TOKEN@*/, height: 100, alignment: /*@START_MENU_TOKEN@*/.center)
                    .padding()
                Text("Second screen")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                NavigationLink(
                    destination: SecondScreen(),
                    label: {
                        ContinueButton(color: .blue, title: "Submit")
                    })
                
                Button("Back", action: { self.mode.wrappedValue.dismiss() })
                    .foregroundColor(.red)
                    .padding(.top)
            }
            .navigationTitle("Notification")
        }
    
}
