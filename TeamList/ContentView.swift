//
//  ContentView.swift
//  TeamList
//
//  Created by Ajay on 25/01/23.
//

import SwiftUI

struct User: Identifiable {
  let id = UUID()
  let name: String
  let designation: String

  static let users = [
    User(name: "Christine Stegner", designation: "Design Lead"),
    User(name: "Brian Foster", designation: "Developer"),
    User(name: "William Vine", designation: "Marketing Lead")
  ]
}

struct ContentView: View {
  @State var isDarkMode = false

  var body: some View {
    NavigationView {
      List {
        ForEach(User.users) { user in
          HStack {
            ZStack {
              Circle()
                .frame(width: 55, height: 55)
                .foregroundColor(.green)
              Text(String("\(user.name.first!)"))
                .foregroundColor(.white)
                .font(.title)
            }

            VStack(alignment: .leading) {
              Text(user.name)
                .font(.system(size: 18))
              Text(user.designation)
                .font(.system(size: 12))
            }
          }
        }
      }
      .listStyle(.plain)
      .navigationTitle("Team")
      .toolbar {
        Button {
          isDarkMode.toggle()
          // Add code to switch between themes
        } label: {
          if isDarkMode {
            Image(systemName: "moon.stars.fill")
              .frame(width: 42, height: 42)
              .foregroundColor(.white)
              .background(.gray)
              .clipShape(Circle())
          } else {
            Image(systemName: "sun.max")
              .bold()
              .frame(width: 42, height: 42)
              .foregroundColor(.white)
              .background(
                LinearGradient(
                  gradient: Gradient(colors: [.orange, .yellow]),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .clipShape(Circle())
              .shadow(color: .gray, radius: 2, x: 1, y: 1)
          }
        }
      }
    }.preferredColorScheme(isDarkMode ? .dark : .light)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
