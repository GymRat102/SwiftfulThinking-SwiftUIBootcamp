//
//  BindingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Weijian Duan on 2025/6/7.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor = Color.green
    @State var title = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

#Preview {
    BindingBootcamp()
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = Color.blue
    
    var body: some View {
        Button {
            title = "Clicked"
            backgroundColor = .orange
            buttonColor = .pink
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}
