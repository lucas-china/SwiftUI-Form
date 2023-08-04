//
//  ContentView.swift
//  SwiftUI-Form
//
//  Created by Lucas Santana Brito on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsLetter = false
    @State private var numberOfLikes = 0
    
    @FocusState private var isFirstNameFocused: Bool
    @FocusState private var isLastNameFocused: Bool
    @FocusState private var isNumberOfLikesFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $firstName)
                        .focused($isFirstNameFocused)
                    TextField("Last Name", text: $lastName)
                        .focused($isLastNameFocused)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }
                
                Section("Actions") {
                    Toggle("Send Newsletter", isOn: $shouldSendNewsLetter)
                    Stepper("Number of Likes", value: $numberOfLikes)
                        .focused($isNumberOfLikesFocused)
                    if numberOfLikes > 1 {
                        Text("This video has \(numberOfLikes) likes")
                    } else {
                        Text("This video has \(numberOfLikes) like")
                    }
                    Link("Terms of Service", destination: URL(string: "https://www.google.com")!)
                }
            }
            .tint(.red)
            .navigationTitle("Account")
            .onSubmit {
                hideKeyboard()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
