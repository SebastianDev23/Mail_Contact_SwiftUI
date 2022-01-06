//
//  ContentView.swift
//  Mail_Contact
//
//  Created by Sebastian Kl
//

import SwiftUI
import MessageUI

struct ContentView: View {
    
    
    @State var result: Result<MFMailComposeResult, Error>? = nil // Mailhelper
    @State private var isShowingMailView = false
    
    
    var body: some View {
        
        ZStack {
            
            Color.blue
                .ignoresSafeArea()
            
            Button("Contact me") {
                isShowingMailView.toggle()
            }
            .padding()
            .background(.ultraThickMaterial)
            .cornerRadius(20)
        }
        .disabled(!MFMailComposeViewController.canSendMail())
        .sheet(isPresented: $isShowingMailView) {
            Mailhelper(result: self.$result)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
