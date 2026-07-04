import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0.0
    @State private var batteryLevel: Double = 0.80
    
    var body: some View {
        VStack {
            // Loading
            ProgressView("Charging")
            
            // Progress bar
            ProgressView(value: progress, total: 1.0)
            Button("Start") {
                withAnimation {
                    progress += 0.1
                }
            }
            
            // Gauge basic
            Gauge(value: 0.65) {
                Text("Battery")
            } currentValueLabel: {
                Text("65%")
            }
            .tint(.yellow)
            
            // Gauge
            Gauge(value: batteryLevel, in: 0 ... 1) {
                Text("Battery Level")
            } currentValueLabel: {
                Text("\(Int(batteryLevel * 100)) %")
            } minimumValueLabel: {
                Text("0%")
            } maximumValueLabel: {
                Text("100%")
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.green)
            .scaleEffect(1.5)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
