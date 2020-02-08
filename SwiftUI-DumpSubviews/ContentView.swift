//
//  ContentView.swift
//  SwiftUI-DumpSubviews
//
//  Created by Daisuke TONOSAKI on 2020/02/08.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack {
                Spacer()
                
                VStack {
                    Text("Top Text")
                    
                    Spacer().frame(height: 300)
                    
                    Button(action: {
                        guard let keyWindow = UIApplication.shared.connectedScenes
                            .filter({$0.activationState == .foregroundActive})
                            .map({$0 as? UIWindowScene})
                            .compactMap({$0})
                            .first?.windows
                            .filter({$0.isKeyWindow}).first else {
                                return
                        }
                        
                        guard let rootViewController = keyWindow.rootViewController else {
                            return
                        }
                        
                        guard let view = rootViewController.view else {
                            return
                        }
                        
                        view.dumpSubviews()
                    }) {
                        Text("Button")
                    }
                    
                    Spacer().frame(height: 500)
                    
                    Text("Bottom Text")
                }
                
                Spacer()
            }
        }
    }
}

extension UIView {
    func dumpSubviews(_ depth: Int = 0) {
        for _ in 0..<depth {
            print("-", terminator: "")
        }
        if depth > 0 {
            print(">", terminator: "")
        }

        print("class[\(String(describing: type(of: self)))]")
        
        for subview in self.subviews {
            subview.dumpSubviews(depth + 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
