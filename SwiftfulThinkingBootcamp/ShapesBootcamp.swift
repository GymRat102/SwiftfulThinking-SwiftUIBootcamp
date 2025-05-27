//
//  ShapesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Weijian Duan on 2025/5/27.
//

import SwiftUI

/*
    Circle()
    Ellipse()
    Rectangle()
    RoundedRectangle()
 
    fill() // fill color
    foregroundColor() // also works
 
    .stroke() make the outline
        - color
        - lineWidth
 
    .trim(from: , to: ) make the shape partial
        - good animation
        - .trim() + .stroke()
 
    .frame(width: , height: ) can always control the frame
 */

struct ShapesBootcamp: View {
    var body: some View {
//        Circle()
//            .fill(Color.green)
//            .foregroundColor(.pink)
        
//        Circle()
//            .stroke()
//            .stroke(Color.red)
//            .stroke(.blue, lineWidth: 30)
         
        // TODO: 一个 status icon 的设计
//        Circle()
//            .stroke(.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round, dash: [40])) // cool
        
        // TODO: 有意思的进度条设计
//        Circle()
//            .trim(from: 0.62, to: 1)
//            .stroke(Color.purple, lineWidth: 40)
        
//        Ellipse()
//            .fill(.green)
//            // 所有上面那些 modifier 都可以放在这里
//            .frame(width: 200, height: 100) // 放在 fill 后面
        
//        Capsule(style: .circular)
//            .fill(.green)
        
//        Rectangle()
        
        // 像一个操场跑圈一样的效果
        RoundedRectangle(cornerRadius: 50)
            // 先 trim 再 stroke
            .trim(from: 0.36, to: 1)
            .stroke(.blue, lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

#Preview {
    ShapesBootcamp()
}
