//
//  Listitem.swift
//
//
//  Created by Alex on 2021-11-05.
//

import SwiftUI
import SwiftAudioPlayer

struct ListItem: View{
    @State private var isExpanded = false
    @State private var anim: CGFloat = 1
    @State private var num: CGFloat = 1
    @State private var playTapped = false
    @State private var tappedHeart = false
    
    //song stuff
    @State private var songDuration = ""
    @State private var trackHead:CGFloat = -120
    @State private var elapsedTime = SAPlayer.shared.prettyElapsedTime ?? "/"
    
    var post: ListDataStore
    
    
    
    var body: some View{
        
        HStack{
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    HStack{
                        Text(post.trackName ?? "1")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                        Text("#\(100 - (Int(post.pop_rating ?? "") ?? 1) + 1 )")
                            .multilineTextAlignment(.trailing)
                            .font(.largeTitle.bold())
                        
                    }
                    
                    
                    if(isExpanded){
                        
                        //  Text("now expanded! \(elapsedTime)")
                        
                        HStack{
                            VStack{
                                Text("\(post.artistName ?? "1")")
                                
                                    .font(.system(size: 17).bold())
                                Text("\(post.albumName ?? "1")")
                                
                                    .font(.system(size: 17).bold())
                                Text("")
                                Text("")
                            }.multilineTextAlignment(.leading)
                            Spacer()
                            AsyncImage(url: URL(string: post.image ?? "1")){ image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            }placeholder: {
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: 150, maxHeight: 150)
                            
                            
                            
                        }
                        
                        
                        
                        
                        HStack{
                            if(playTapped){
                                Button(action: pauseMusic){
                                    Image(systemName: "pause.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                }
                                .padding()
                            }
                            else{
                                Button(action: playMusic){
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                    
                                }
                                .padding()
                            }
                            
                            
                            VStack{
                                ZStack{
                                    
                                    Circle()
                                        .fill(Color.black)
                                        .offset(x: trackHead)
                                        .animation(.easeInOut, value: 1)
                                        .frame(width: 10, height: 10)
                                    
                                    
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width:250, height: 1)
                                    
                                    
                                }
                                
                            }
                            Spacer()
                            Button(action: tapHeart){
                                if(tappedHeart){
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.red)
                                }else{
                                    Image(systemName: "heart")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    Spacer()
                    
                    
                    Divider().frame(height: 0.5).background(Color.black)
                    HStack {
                        Text("Post Updated")
                            .font(.caption)
                            .foregroundColor(.black)
                        Spacer()
                        Text(post.releaseDate ?? "1")
                            .font(.caption)
                            .foregroundColor(.black)
                        
                    }.padding(.bottom, 20)
                    
                }.padding(.top, 30)
            }
            .padding(.horizontal)
            
        }
        .onTapGesture {withAnimation {
            if(num == 1){
                num = 3
                isExpanded = true
            }
            else{
                num = 1
                isExpanded = false
            }
        }
            
        }
        .animation(.easeInOut, value: anim)
        
        
        
        
    }
    func tapHeart(){
        // add something
        tappedHeart.toggle()
    }
    func playMusic() {
        /*
         song duration
         */
        if let url = URL(string: post.preview_url ?? ""){
            
            SAPlayer.shared.startRemoteAudio(withRemoteUrl: url)
            SAPlayer.shared.play()
        }
        else{
            
        }
        
        playTapped.toggle()
        
        //print song stat
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            songDuration = SAPlayer.shared.prettyDuration ?? ""
            elapsedTime = SAPlayer.shared.prettyElapsedTime ?? ""
//            let info = SALockScreenInfo(title: post.trackName ?? "1", artist: post.artistName ?? "1", albumTitle: post.albumName, artwork: UIImage(named: "thumnail"), releaseDate: 11112233)
//            SAPlayer.shared.mediaInfo = info
        }
        
        //move head
        _ = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: playTapped) { timer in
            if(playTapped){
                if(trackHead > 120){
                    timer.invalidate()
                    SAPlayer.shared.pause()
                }
                else{
                    withAnimation{
                        trackHead += 2
                    }
                    
                    
                }
            }
        }
        
        trackHead = -120
        
    }
    func pauseMusic() {
        trackHead = -120
        SAPlayer.shared.pause()
        playTapped.toggle()
    }
}
