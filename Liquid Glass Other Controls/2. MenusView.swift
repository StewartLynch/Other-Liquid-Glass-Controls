//
//----------------------------------------------
// Original project: Liquid Glass Other Controls
// by  Stewart Lynch on 2025-07-31
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct MenusView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.petals)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .bottom)
                Menu("Menu") {
                    Button("First Item") {}
                    Button("Second Item", systemImage: "2.circle") {}
                    Button("Delete", systemImage: "trash", role: .destructive) {}
                    Menu {
                        Button("Sub 1"){}
                        Button("Sub 2") {}
                    } label: {
                        Label("Submenu", systemImage: "filemenu.and.cursorarrow")
                    }
                }
                .padding()
                .buttonStyle(.glass) // This now works
//                .glassEffect()
            }
            .navigationTitle("Menus")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu("Menu") {
                        Button("First Item") {}
                        Button("Second Item", systemImage: "2.circle") {}
                        Button("Delete", systemImage: "trash", role: .destructive) {}
                        Menu {
                            Button("Sub 1"){}
                            Button("Sub 2") {}
                        } label: {
                            Label("Submenu", systemImage: "filemenu.and.cursorarrow")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenusView()
}
