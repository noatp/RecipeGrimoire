//
//  ShimmeringRect.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/19/21.
//

import SwiftUI

struct ShimmeringRect: View {
    private struct Constants {
        static let duration: Double = 1.0
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 0.75
    }
    
    @State private var opacity: Double = Constants.minOpacity
    
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
            }
    }
}

struct ShimmeringRect_Previews: PreviewProvider {
    static var previews: some View {
        ShimmeringRect()
    }
}
