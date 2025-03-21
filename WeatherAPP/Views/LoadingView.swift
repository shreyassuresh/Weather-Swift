//
//  LoadingView.swift
//  WeatherAPP
//
//  Created by Teacher on 21/03/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
        ProgressView()
                  .progressViewStyle(CircularProgressViewStyle(tint: .white))
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
