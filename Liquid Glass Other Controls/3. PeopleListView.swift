//
//----------------------------------------------
// Original project: Liquid Glass Other Controls
// by  Stewart Lynch on 2025-07-29
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

struct PeopleListView: View {
    @State private var manager = DataManager()
    @State private var text = ""
    @FocusState private var isFocused: Bool
    @State private var isExpanded = false
    @Namespace private var namespace
    var body: some View {
        NavigationStack {
            List(manager.people.sorted(), id: \.self) { person in
                Text(person) 
            }
            .listStyle(.plain)
            .navigationTitle("People List")
            .toolbarTitleDisplayMode(.inlineLarge)
            .safeAreaBar(edge: .bottom, alignment: .trailing) {
                GlassEffectContainer {
                    HStack {
                        if isExpanded {
                            TextField("Enter Name", text: $text)
                                .padding()
                                .glassEffect()
                                .glassEffectID("text", in: namespace)
                                .glassEffectTransition(.matchedGeometry)
                                .focused($isFocused)
                                .submitLabel(.done)
                                .onSubmit {
                                    withAnimation {
                                        if isExpanded, !text.isEmpty {
                                            manager.addPerson(text)
                                        } else {
                                            isFocused = true
                                        }
                                        text = ""
                                        isExpanded.toggle()
                                    }
                                }
                        }
                        Image(systemName: isExpanded ? "checkmark" : "plus")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect(.regular.interactive())
                            .glassEffectID("plus", in: namespace)
                            .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
                            .onTapGesture {
                                withAnimation {
                                    if isExpanded, !text.isEmpty {
                                        manager.addPerson(text)
                                    } else {
                                        isFocused = true
                                    }
                                    text = ""
                                    isExpanded.toggle()
                                }
                            }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    PeopleListView()
}
