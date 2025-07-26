//
//  Extensions.swift
//  WeatherView
//
//  Created by Deko on 23/07/25.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    func getWeatherIcon(_ condition: String) -> String {
        switch condition.lowercased() {
        case "clear":
            return "sun.max"
        case "clouds":
            return "cloud"
        case "rain":
            return "cloud.rain"
        case "drizzle":
            return "cloud.drizzle"
        case "thunderstorm":
            return "cloud.bolt.rain"
        case "snow":
            return "snow"
        case "mist", "smoke", "haze", "fog":
            return "cloud.fog"
        default:
            return "questionmark.circle"
        }
    }

}



struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
