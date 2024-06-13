//
//  HomeView.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("OLA HOME VIEW")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
