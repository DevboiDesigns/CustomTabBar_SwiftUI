//
//  ContentView.swift
//  CustomTabBar-SwiftUI
//
//  Created by Christopher Hicks on 12/30/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var showModal = false
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Tab 2
            Spacer()
                .fullScreenCover(isPresented: $showModal) {
                    Button {
                        showModal.toggle()
                    } label: {
                        Text("Fullscreen")
                    }

                }
            
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        ScrollView {
                            ForEach(0..<100) { num in
                                Text("\(num)")
                                
                            }
                        }
                        .navigationTitle("First Tab")
                    }
                case 1:
                    ScrollView {
                        Text("Second")
                        
                    }
                default:
                    NavigationView {
                        Text("Third")
                        
                    }
                }
            }
            //Spacer()
            
            Divider()
                .padding(.bottom, 12)
            
            HStack {
                ForEach(0..<5) { tab in
                    Button {
                        
                        if tab == 2 {
                            showModal.toggle()
                            return
                        }
                        selectedIndex = tab
                    } label: {
                        Spacer()
                        
                        if tab == 2 {
                            Image(systemName: tabBarImageNames[tab])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.red)
                        } else {
                            Image(systemName: tabBarImageNames[tab])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == tab ? Color(.label) : .init(white: 0.8))
                           
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
