//
//  ListView.swift
//  MatchingWithSwiftUI
//
//  Created by G-2028 on 2026/08/14.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(spacing: 0){
            //Cards
            ZStack{
                ForEach(0..<5) { _ in
                   CardView()
                }
            }
            
            //Actions
            HStack(spacing: 68){
                Circle()
                    .frame(width: 50, height: 50)
                Circle()
                    .frame(width: 50, height: 50)
                Circle()
                    .frame(width: 50, height: 50)
            }
            .foregroundStyle(Color.white)
            .frame(height: 100)
        }
        .background(.black, in: RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 6)
        
    }
}

#Preview {
    ListView()
}
