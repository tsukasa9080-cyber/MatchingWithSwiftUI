//
//  CardView.swift
//  MatchingWithSwiftUI
//
//  Created by G-2028 on 2026/08/19.
//

import SwiftUI

struct CardView: View {
    
    @State private var offset: CGSize = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .bottom){
            //background
            Color.black
            
            //image
            imageLayer
            
            //Gradient
            LinearGradient(colors: [.clear, .black], startPoint: .center  ,endPoint: .bottom)
            
            //Information
            informationLayer
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .offset(offset)
        .gesture(gesture)
    }
}

#Preview {
    ListView()
}

//MARK: -UI
extension CardView{
    
    private var imageLayer: some View{
        Image("user01")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100)
    }
    
    private var informationLayer: some View{
        VStack(alignment: .leading){
            HStack(alignment: .bottom){
             
                Text("ブルー")
                    .font(.largeTitle.bold())
                
                Text("99")
                    .font(.title2)
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.white, .blue)
                    .font(.title2)
            }
            Text("よろしくお願いします")
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

//MARK: -Action
extension CardView{
    
    private var gesture: some Gesture{
        DragGesture()
            .onChanged{ value in
                let width = value.translation.width
                let height = value.translation.height
                
//                var limitedHeight: CGFloat = 0
                
//                if (height > 0){
//                    if(height > 100){
//                        limitedHeight = 100
//                    } else {
//                        limitedHeight = height
//                    }
//                } else {
//                    if(height < -100){
//                        limitedHeight = -100
//                    } else {
//                        limitedHeight = height
//                    }
//                }
                
                let limitedHeight = height > 0 ? min(height, 100) : max(height, -100)
                
                offset = CGSize(width: width, height: limitedHeight)
            }
            .onEnded { value in
                withAnimation(.smooth) {
                    offset = .zero
                }
            }
    }
}
