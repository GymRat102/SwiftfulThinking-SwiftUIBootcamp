//
//  TextBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Weijian Duan on 2025/5/27.
//

import SwiftUI

/*
 "String".capitalized
 "String".lowercase()
 
 .font() .body .caption
 .fontWeight() .bold .semibold
    .bold() shortcut
 
 .underline()
 .strikethrough()
 --> (true, color: .red) version
 .italic()
 
 .font(.system(size: , weight: , design: )) // most specific
 
 // advanced typography
 .baselineOffset(10.0)
 .kerning(10)
 */
struct TextBootcamp: View {
    var body: some View {
        Text("Hello World".capitalized)
//            .font(.body)
//            .fontWeight(.semibold)
//            .bold()
//            .underline()
//            .underline(true, color: .red)
//            .italic()
//            .strikethrough(true, color: .green)
        
            // the most specific way, but will not resize automatically
//            .font(.system(size: 24, weight: .semibold, design: .serif))
        
//            .baselineOffset(10.0)
//            .kerning(10)
            .multilineTextAlignment(.trailing) // leading trailing center
            .foregroundColor(.red) // font color
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
}

#Preview {
    TextBootcamp()
}
