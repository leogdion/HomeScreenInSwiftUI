//
//  ContentView.swift
//  homescreentest
//
//  Created by Leo Dion on 6/28/20.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        ZStack {
            Image("homescreen")
//            GeometryReader{
//                geometry in
//                Rectangle()
//                    .padding(.all, 68.0/1000.0 * geometry.size.height)
//                    .padding(.vertical, 50/1000.0 * geometry.size.height)
//                    .padding(.bottom, 60/1000.0 * geometry.size.height)
//            }
            
            GeometryReader{
                geomerty in
                VStack(spacing: 0.02*geomerty.size.height, content: {
                HStack(spacing: 0.05*geomerty.size.width, content: {
                        VStack{
                            Rectangle().frame(width: (0.6*geomerty.size.width)/4.0, height: (450.0/1000.0*geomerty.size.height)/6.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("App Name")
                        }
                    VStack{
                        Rectangle().frame(width: (0.6*geomerty.size.width)/4.0, height: (450.0/1000.0*geomerty.size.height)/6.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("App Name")
                    }
                    
                    
                })
                    
                    HStack(spacing: 0.05*geomerty.size.width, content: {
                            VStack{
                                Rectangle().frame(width: (0.6*geomerty.size.width)/4.0, height: (450.0/1000.0*geomerty.size.height)/6.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("App Name")
                            }
                        VStack{
                            Rectangle().frame(width: (0.6*geomerty.size.width)/4.0, height: (450.0/1000.0*geomerty.size.height)/6.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("App Name")
                        }
                        
                        
                    })
                })
                    .padding(.all, 65.0/1000.0 * geomerty.size.height)
                .padding(.vertical, 48.0/1000.0 * geomerty.size.height)
                    .padding(.bottom, 60/1000.0 * geomerty.size.height)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewLayout(PreviewLayout.fixed(width: 250, height: 500))
        ContentView().previewLayout(PreviewLayout.fixed(width: 500, height: 1000))
        }
    }
}
