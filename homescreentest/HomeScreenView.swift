//
//  HomeScreenView.swift
//  homescreentest
//
//  Created by Leo Dion on 7/3/20.
//

import SwiftUI

struct MockApp {
    let name : String
    let icon : Image
    let id = UUID()
}

struct MockAppRow {
    let apps : [MockApp]
    let id = UUID()
}

extension Array where Element == MockAppRow {
//    var rowCount : Int {
//        min((self.repository.gridApps.count+3) / 4, 6)
//    }
//
//    func columnCount(forRow row: Int) -> Int {
//        if 4*(row+1) < repository.gridApps.count {
//            return 4
//        } else if 4*(row) > repository.gridApps.count {
//            return 0
//        } else {
//            return 4 + repository.gridApps.count - 4*(row+1)
//        }
//    }
    init (apps: [MockApp], rowSize: Int) {
        var result = [Element]()
        for row in (apps.count +3) / rowSize {
            
        }
        self = result
    }
}

class MockAppGenerator {
    let names : Set<String>
    let icons : [Image]
    
    init () {
        guard let namesURL = Bundle.main.url(forResource: "names", withExtension: "csv") else {
            preconditionFailure()
        }
        
        self.names = Set(try! String(contentsOf: namesURL).components(separatedBy: .newlines))
        
        self.icons = Bundle.main.url(forResource: "icons-apple", withExtension: "txt").flatMap { (url) in
            try? String(contentsOf: namesURL).components(separatedBy: .newlines)
        }?.map{Image($0)} ?? [Image]()
    }
    
    func app () -> MockApp {
        
        guard let name = names.randomElement() else {
            preconditionFailure()
        }
        guard let icon = icons.randomElement() else {
            preconditionFailure()
        }
        return MockApp(name: name, icon: icon)
    }
}

extension MockAppGenerator {
    func appsWithCount(_ count: Int) -> [MockApp] {
        return (0..<count).map{ _ in
            self.app()
        }
    }
}
class MockAppRepository : ObservableObject {
    @Published var gridCount : Int = 0
    @Published var dockCount : Int = 0
    @Published var gridAppRows = [MockAppRow]()
    @Published var dockApps = MockAppRow(apps: [MockApp]())
    let generator = MockAppGenerator()
    
    
    init (
        gridCount : Int,
        dockCount : Int
    ) {
        
        self.$gridCount.map(self.generator.appsWithCount(_:)).receive(on: DispatchQueue.main).assign(to: self.$gridApps)
        
            self.gridCount = gridCount
            self.dockCount = dockCount
    }
}

struct HomeScreenView: View {
    @EnvironmentObject var repository: MockAppRepository
    
    
    var rowCount : Int {
        min((self.repository.gridApps.count+3) / 4, 6)
    }
    
    func columnCount(forRow row: Int) -> Int {
        if 4*(row+1) < repository.gridApps.count {
            return 4
        } else if 4*(row) > repository.gridApps.count {
            return 0
        } else {
            return 4 + repository.gridApps.count - 4*(row+1)
        }
    }
    var body: some View {
        ZStack{
            Image("homescreen")
            
            GeometryReader{
                geomerty in
                VStack(alignment: .leading,
                       spacing: 0.02*geomerty.size.height,
                       
                       content: {
                    ForEach(0..<rowCount) {  row in
                        HStack(spacing: 0.05*geomerty.size.width, content: {
                            ForEach(0..<columnCount(forRow: row)) { column in
                            VStack{
//                                self.repository.dockApps[0].icon
                                Rectangle().frame(width: (0.6*geomerty.size.width)/4.0, height: (450.0/1000.0*geomerty.size.height)/6.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(self.repository.dockApps[0].name)
                            }
                        }
                        })
                    }
                }).padding(.all, 65.0/1000.0 * geomerty.size.height)
                .padding(.vertical, 48.0/1000.0 * geomerty.size.height)
                    
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView().previewLayout(PreviewLayout.fixed(width: 250, height: 500)).environmentObject(MockAppRepository(gridCount: 23, dockCount: 3))
    }
}
