//
//  ContentView.swift
//  OnZenRemake
//
//  Created by Albert Florido  on 10/2/23.
//test commit
//
import SwiftUI

struct ContentView: View {
    @State private var prompts: [String] = ["Who?","When?","What?","Where?","Why?"]
    
    
    @State var isToggle: Bool = false
    
    var body: some View {
        ZStack {
            Color( isToggle ? "reflectBackground" : "releaseBackground")
                .ignoresSafeArea()
            
            VStack {
                infoButton()
                Image( isToggle ? "onZenReflectLogo" : "onZenReleaseLogo")
                Spacer().frame (height: 4)
                    .padding()
                
                HStack {
                    Text("Release")
                        .font(Font.custom("SFProRounded-Medium", size: 29))
                        .padding(.leading)
                        
                    
                    
                    Toggle("",isOn: $isToggle)
                        .frame(width: 80)
                        
                    
                    
                    Spacer().frame(width: 60 )
                    
                    Text("Reflect")
                        .font(Font.custom("SFProRounded-Medium", size: 29))
                        .padding(.trailing)
                    
                }
                VStack(spacing: 20) {
                    mainButton(buttonPrompt: prompts[0])
                    mainButton(buttonPrompt: prompts[2])
                    mainButton(buttonPrompt: prompts[1])
                    mainButton(buttonPrompt: prompts[3])
                    mainButton(buttonPrompt: prompts[4])
                }
                Spacer()
                Image("zenCircle")
                    .resizable()
                    .frame(width: 75, height: 75)
                
            }
            
            
            
        }
        
    }
 
}

#Preview {
    ContentView()
}

struct mainButton: View {
    var buttonPrompt: String
    
    var body: some View {
       
        HStack{
            Text(buttonPrompt)
            
                .font(Font.custom("SFProRounded-Medium", size: 30))
                .frame(width: 350, height: 60)
                .background(.reflectButton)
                
        }
    }
}

struct infoButton: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing)
            
        }
    }
}
