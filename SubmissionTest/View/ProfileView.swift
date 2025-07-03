//
//  ProfileView.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 03/07/25.
//

import SwiftUI
struct ProfileView: View {
    var body: some View {
        ScrollView {
            Text("About Me")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .padding(.top, 16)
            VStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        Image("pict_profile")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                    )
                    .frame(width: 200, height: 200)
                    .padding(5)
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                    )
                
                Text("Heri Sandiyadi")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top, 16)
                
                Text("Mobile Developer")
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                    .foregroundColor(.black)
                
                Text("“Di balik tampilan yang mulus, ada ribuan error yang sudah dikalahkan.”")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .italic()
                    .foregroundColor(Color("GreyColor"))
                    .padding(4)
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
