//
//  Stepper.swift
//  Stepper
//
//  Created by Alex S. on 09/12/2022.
//

import SwiftUI

struct CustomStepper<Label: View>: View {
    @Binding var value: Int
    let `in`: ClosedRange<Int>
    @ViewBuilder let label: Label
    @Environment(\.stepperStyle) var style
    
    var body: some View {
        AnyView(style.makeBody(
            .init(
                value: $value,
                range: `in`,
                label: .init(_label: AnyView(label))
            )
        ))
    }
}
