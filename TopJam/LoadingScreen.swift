//
//  LoadingScreen.swift
//  TopJam
//
//  Created by Alex on 2021-11-07.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        GeometryReader{ g in
            NavigationView{
                VStack(alignment: .center){
                    
                    
                    ZStack{
                        
                        VStack(spacing: 0){
                            Text("TOP")
                                .foregroundColor(.blue)
                                .font(.system(size: 75.0))
                                .fontWeight(.heavy)
                            Text("JAM")
                                .foregroundColor(.blue)
                                .font(.system(size: 75.0))
                                .fontWeight(.heavy)
                        }
                        .offset(x: 6, y: 6)
                        VStack{
                            Text("TOP")
                                .foregroundColor(.red)
                                .font(.system(size: 75.0))
                                .fontWeight(.heavy)
                            Text("JAM")
                                .foregroundColor(.red)
                                .font(.system(size: 75.0))
                                .fontWeight(.heavy)
                        }
                        .offset(x: 3, y: 3)
                        VStack{
                            Text("TOP")
                                .foregroundColor(.white)
                                .font(.system(size: 75.0))
                                .fontWeight(.heavy)
                            Text("JAM")
                                .foregroundColor(.white)
                                .font(.system(size: 75.0))
                                .fontWeight(.heavy)
                        }
                        
                        
                        
                    }
                    .offset(y: -25)
                    .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: -2))
                    
                }
                .frame(width: g.size.width, height: g.size.height)
                .background(Color.black)
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
