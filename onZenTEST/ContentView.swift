//
//  ContentView.swift
//  OnZenRemake
//
//  Created by Albert Florido  on 10/2/23.
//test commit
//
import SwiftUI

enum ActiveSheet: Identifiable {
    case first, second, third
    
    var id: Int {
        hashValue
    }
}

struct ContentView: View {
   var prompts: [String] = ["Who?","When?","What?","Where?","Why?"]
    
    
    @State var activeSheet: ActiveSheet?
    @State var isToggle: Bool = false
    @State var questionPromt: String
  
    
    var body: some View {
        ZStack {
            Color( isToggle ? .zenDarkmodeRef : .pink)
                .ignoresSafeArea()
            
            VStack {
                infoButton(activeSheet: $activeSheet)
                Image("test")
                    .padding()
                
                HStack {
                    Text("Release")
                        .font(Font.custom("SFProRounded-Medium", size: 29))
                        .padding(.leading)
                    
                    Spacer().frame (width: 20)
                    
                    
                    Toggle("",isOn: $isToggle)
                        .frame(width: 80)
                        
                    
                    
                    Spacer().frame(width: 60 )
                    
                    Text("Reflect")
                        .font(Font.custom("SFProRounded-Medium", size: 29))
                        .padding(.trailing)
                    
                }
                
                VStack(spacing: 20) {
                    mainButton(activesheet: $activeSheet, questionPromt: $questionPromt, question: "who hurt you", buttonPrompt: prompts[0])
                    mainButton(activesheet: $activeSheet, questionPromt: $questionPromt, question: "what hurt you", buttonPrompt: prompts[2])
                    mainButton(activesheet: $activeSheet, questionPromt: $questionPromt, question: "when hurt you", buttonPrompt: prompts[1])
                    mainButton(activesheet: $activeSheet, questionPromt: $questionPromt, question: "where hurt you", buttonPrompt: prompts[3])
                    mainButton(activesheet: $activeSheet, questionPromt: $questionPromt, question: "why hurt you", buttonPrompt: prompts[4])
                }
                
                Spacer()
                Image("zenCircle")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .onTapGesture {
                        activeSheet = .first
                    }
                
            }
            
            
            
        }
        .sheet(item: $activeSheet) { item in switch item {
        case .first: welcomeSheet()
        case .second: infoSheet()
        case .third: 
            halfSheet(questionPromt: $questionPromt)
                .presentationDetents([.medium])
                .presentationDragIndicator(.automatic)
            
            
        }}
        
    }
 
}

#Preview {
    ContentView(questionPromt: "")
}

struct mainButton: View {
    @Binding var activesheet: ActiveSheet?
    @Binding var questionPromt: String

    
    var question: String
    var buttonPrompt: String
  
    
    var body: some View {
       
        HStack{
            Text(buttonPrompt)
                .font(Font.custom("SFProRounded-Medium", size: 30))
                .frame(width: 350, height: 60)
                .background(.reflectButton)
                .onTapGesture {
                    activesheet = .third
                    questionPromt = question
                    
                  
                }
                
        }
    }
}

struct infoButton: View {
    @Binding var activeSheet: ActiveSheet?
    
    var body: some View {
        
        HStack {
            Spacer()
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing)
                .onTapGesture {
                    activeSheet = .second
                    
                }
            
        }
    }
}
