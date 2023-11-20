//
//  EntryView.swift
//  User Management
//
//  Created by Nikhil Kumar on 11/11/23.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Circle().foregroundColor(Color.pink).frame(width: 300, height: 300)
                VStack {
                    Text("User Mgt.").font(.system(size: 50)).foregroundColor(Color.white).bold()
                    NavigationLink("Next", destination: UserListView()).foregroundColor(Color.white).font(.system(size: 30)).bold()
                    
                }
                
            }
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
