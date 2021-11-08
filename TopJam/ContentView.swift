//
//  ContentView.swift
//  TopJam
//
//  Created by Alex on 2021-11-05.
//

import SwiftUI

import CoreData
//import SwiftAudioPlayer


extension Color {
    static let lightPink = Color(red: 236 / 255, green: 188 / 255, blue: 180 / 255)
    static let lightGray = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let lightOrange = Color(red: 219 / 255, green: 98 / 255, blue: 68 / 255)
    //    static let iconGray = Color(red: 112 / 255, green: 112 / 255, blue: 112 / 255)
    static let lighterPink = Color(red: 233 / 255, green: 219 / 255, blue: 210 / 255)
    static let lighterGray = Color(red: 214 / 255, green: 214 / 255, blue: 214 / 255)
}


struct ContentView: View {
    
    
    //add to coredata
    @Environment(\.managedObjectContext) var moc
    var fetchRequest: NSFetchRequest<ListDataStore> = ListDataStore.fetchRequest()
    //alphabetical sort
    @FetchRequest(entity: ListDataStore.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListDataStore.trackName, ascending: true)], predicate: NSPredicate(format: "trackName > %@", "A")) var results2: FetchedResults<ListDataStore>
    //rating sort
    @FetchRequest(entity: ListDataStore.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListDataStore.pop_rating, ascending: false)], predicate: NSPredicate(format: "pop_rating > %@", "0")) var results: FetchedResults<ListDataStore>
    @State private var searchEntry: String = "S"
    
    
    
    //    filter list based off search sort
    @FetchRequest(entity: ListDataStore.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListDataStore.trackName, ascending: true)]) var items: FetchedResults<ListDataStore>
//    var fetchRequest2: FetchRequest<ListDataStore>


    
    @State private var isExpanded: Bool = false
    @State private var sortOrderToggle = false
    
    @State private var listResults: [ListDataStore] = [ListDataStore]()
    
    
    @State private var searchToggled = false
    @State private var searchYOffset: CGFloat = -25
    @State private var data: [ListData] = [ListData]()
    
    @State private var loadedData = false
    //color of items
    @State private var newColor = colorArray[Int.random(in: 0..<colorArray.count)]
    
    var filteredItems: [ListDataStore]{
        if(searchEntry != ""){
            return items.filter({$0.wrappedTrackName.contains(searchEntry)})
        }
//        else{
//            return items.sorted(by: {$0.index < $1.index})
//        }
        return [ListDataStore]()
    }
    var body: some View {
        if(!data.isEmpty){
            GeometryReader { g in
                NavigationView {
                    ScrollView {
                        VStack{
                            HStack {
                                Button(action: toggleSort){
                                    if(sortOrderToggle){
                                        Image(systemName: "arrow.down.square.fill")
                                            .font(.title.bold())
                                            .foregroundColor(.white)
                                    }else{
                                        Image(systemName: "a.square.fill")
                                            .font(.title.bold())
                                            .foregroundColor(.white)
                                    }
                                }
                                Button(action: deleteobj){
                                    Image(systemName: "trash.fill")
                                        .font(.title.bold())
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                ZStack{
                                    
                                    VStack(spacing: 0){
                                        Text("TOP")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 20.0))
                                            .fontWeight(.heavy)
                                        Text("JAM")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 20.0))
                                            .fontWeight(.heavy)
                                    }
                                    .offset(x: 3, y: 3)
                                    VStack{
                                        Text("TOP")
                                            .foregroundColor(.red)
                                            .font(.system(size: 20.0))
                                            .fontWeight(.heavy)
                                        Text("JAM")
                                            .foregroundColor(.red)
                                            .font(.system(size: 20.0))
                                            .fontWeight(.heavy)
                                    }
                                    .offset(x: 1.5, y: 1.5)
                                    VStack{
                                        Text("TOP")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20.0))
                                            .fontWeight(.heavy)
                                        Text("JAM")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20.0))
                                            .fontWeight(.heavy)
                                    }
                                    
                                    
                                    
                                }
                                .rotation3DEffect(.degrees(5), axis: (x: 0, y: 1, z: -2))
                                
                                
                                Spacer()
                                Button(action: createSearch){
                                    Image(systemName: "magnifyingglass")
                                        .font(.title.bold())
                                        .foregroundColor(.white)
                                }
                            }.padding().ignoresSafeArea()
//                            if(searchToggled){
//                                TextField("search", text: $searchEntry)
//                                    .padding(20)
//                                    .frame(height: 50)
//                                    .background(Color.white)
//                                    .padding(.leading, 30)
//                                    .padding(.trailing, 30)
//                                    .offset(y: CGFloat(searchYOffset))
//                            }
                        }
                        VStack {
                            if(!searchToggled){
                                ForEach(listResults, id:\.self) { item in
                                    
                                    ListItem(post: item)
                                        .background(colorArray[Int.random(in: 0..<colorArray.count)])
                                        .animation(.easeInOut, value: colorArray[Int.random(in: 0..<colorArray.count)])
                                }
                            }
                            else{
                                TextField("search", text: $searchEntry)
                                    .padding(20)
                                    .frame(height: 50)
                                    .background(Color.white)
                                    .padding(.leading, 30)
                                    .padding(.trailing, 30)
                                    .offset(y: CGFloat(searchYOffset))
                                Text(" TEST TEST TEST")
                                    .foregroundColor(.white)
//                                FilteredList(filter: searchEntry)
                                ForEach(filteredItems, id:\.self){ item in
//                                    Text("name \(item)")
//                                        .foregroundColor(.white)
                                    ListItem(post: item)
                                        .background(colorArray[Int.random(in: 0..<colorArray.count)])
                                        .animation(.easeInOut, value: colorArray[Int.random(in: 0..<colorArray.count)])
                                }
                            
                            }
                        }

                            
                        }
                        .frame(width: g.size.width, height: g.size.height)
                        .background(Color.black)
                        
                        .navigationBarHidden(true)
                    }
                }
            }
            else{
                LoadingScreen().onAppear(perform: loadData)
                
            }
            
            
        }
        func deleteobj() {
            print("deleting items...")
            for index in results {
                moc.delete(index)
            }
            do {
                try moc.save()
            } catch {
                // handle the Core Data error
                print("error u done messed up")
            }
        }
        func loadData(){
            print("test 1")
            if(results.count < 100){
                print("test 2")
                data = Bundle.main.decode("dummy-data.json")
                PersistenceController.shared.container.performBackgroundTask { moc in
                    
                    
                    for i in 0..<data.count{
                        let item = ListDataStore(context: moc)
                        item.track_uri = data[i].track_uri
                        item.trackName = data[i].trackName
                        item.artists_uri = data[i].artists_uri
                        item.artistName = data[i].artistName
                        item.albumName = data[i].albumName
                        item.album_artists_uri = data[i].album_artists_uri
                        item.album_artistName = data[i].album_artistName
                        item.releaseDate = data[i].releaseDate
                        item.image = data[i].Image
                        item.discNum = data[i].discNum
                        item.trackNum = data[i].trackNum
                        item.duration = data[i].duration
                        item.preview_url = data[i].preview_url
                        item.explicit = data[i].explicit
                        item.pop_rating = data[i].pop_rating
                        item.added_by = data[i].added_by
                        item.added_at = data[i].added_at
                        try? moc.save()
                    }
                }
                // add to state var
                
                
            }
            for i in 0..<results.count{
                let item = results[i]
                listResults.append(item)
                
            }
            
            
            print(results.count)
            print(listResults.count)
            loadedData.toggle()
            
        }
        
        func toggleSort(){
            sortOrderToggle.toggle()
            listResults = [ListDataStore]()
            if(!sortOrderToggle){
                listResults = [ListDataStore]()
                for i in 0..<results.count{
                    let item = results[i]
                    listResults.append(item)
                    
                }
            }
            else{
                listResults = [ListDataStore]()
                for i in 0..<results2.count{
                    let item = results2[i]
                    listResults.append(item)
                    
                }
            }
        }
        
    func createSearch(){
            withAnimation(.easeInOut){
                searchYOffset = 0
                searchToggled.toggle()
                
            }
            //    filter = searchEntry
            listResults = [ListDataStore]()
//            for i in 0..<fetchRequest2.wrappedValue.count{
//                let item = fetchRequest2.wrappedValue[i]
//                listResults.append(item)
//
//            }
        print("creating search")
            
        }
        
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
//        filter: "S"
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
