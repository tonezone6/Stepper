//
//  ContentView.swift
//  Stepper
//
//  Created by Alex Stratu on 18/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 1
    
    var body: some View {
        List {
            Section("Default style") {
                CustomStepper(value: $value, in: 1...999) {
                    Text("Quantity: \(value)")
                }
            }
            .padding(4)
            
            Section("Vertical style") {
                CustomStepper(value: $value, in: 1...999) {
                    Text("Quantity")
                }
                .stepperStyle(.vertical)
            }
            
            Section("Capsule style") {
                CustomStepper(value: $value, in: 1...999) {
                    Text("Quantity")
                }
                .controlSize(.mini)
                
                CustomStepper(value: $value, in: 1...999) {
                    Text("Quantity")
                }
                .controlSize(.small)
                .tint(.orange)
                
                CustomStepper(value: $value, in: 1...999) {
                    Text("Quantity")
                }
                .controlSize(.regular)
                .tint(.teal)
            }
            .stepperStyle(.capsule)
            .padding(4)
        }
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: 24) {
                Text("Default, vertical, capsule")
                Spacer()
            }
            .padding()
            .background(.regularMaterial)
        }
        .listStyle(.plain)
        .navigationTitle("Stepper")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
