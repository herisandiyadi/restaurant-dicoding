//
//  HomeView.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 02/07/25.
//

import SwiftUI

struct HomeView: View {
    @State private var navToProfile: Bool? = nil

    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
               
                HStack {
                    Text("**Dicoding** Restaurant")
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .frame(height: 100).onTapGesture {
                            navToProfile = true
                        } .navigationDestination(item: $navToProfile){
                            data in ProfileView()
                        }
                }
                .padding(16)
                
                Divider() 
                
                RestaurantListView()
            }
        }
    }
    
}

#Preview {
    HomeView()
}
