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
//            Button (action: {
//                self.tab = .search
//            }) {
//                VStack{
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//            }
//            .foregroundColor(self.tab == .search ? .blue : .secondary)
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 4)
//
//            Button (action: {
//                self.tab = .bookmark
//            }) {
//                VStack{
//                    Image(systemName: "bookmark")
//                    Text("Bookmark")
//                }
//                
//            }
//            .foregroundColor(self.tab == .bookmark ? .blue : .secondary)
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 4)
//        }
//        .background(Color.theme.background.opacity(0.1))
//        .frame(
//            maxWidth: .infinity
//        )
//        .cornerRadius(20)
//
//    }
//}
//
//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group{
//            TabView(tab: .constant(.search))
//            TabView(tab: .constant(.bookmark))
//                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
