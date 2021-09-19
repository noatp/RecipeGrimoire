////
////  TabView.swift
////  RecipeGrimoire
////
////  Created by Toan Pham on 9/19/21.
////
//
//import SwiftUI
//
//struct TabView: View {
//    typealias Tab = AppViewModel.Tab
//    @Binding var tab: Tab
//    
//    var body: some View {
//        HStack {
//            Group {
//                Spacer()
//                                
//                Button (action: {
//                    self.tab = .search
//                }) {
//                    Label("Search", systemImage: "magnifyingglass")
//                }
//                .foregroundColor(self.tab == .search ? .blue : .secondary)
//                
//                Spacer()
//                
//                Button (action: {
//                    self.tab = .bookmark
//                }) {
//                    Label("Bookmark", systemImage: "bookmark")
//                }
//                .foregroundColor(self.tab == .bookmark ? .blue : .secondary)
//                
//                Spacer()
//            }
//        }
//        .padding(.bottom, 30)
//        .padding(.top, 10)
//        .background(Color(red: 0.8, green: 0.8, blue: 0.8))
//        .font(.system(size: 30))
//        .frame(height: 80)
//    }
//}
//
//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group{
//            TabView(tab: .constant(.search))
//            TabView(tab: .constant(.bookmark))
//        }
//    }
//}
