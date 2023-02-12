import SwiftUI

struct CanvasItem<Content>: View where Content: View {
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    @GestureState private var fingerLocation: CGPoint? = nil
    @GestureState private var startLocation: CGPoint? = nil
    @State var magScale: CGFloat = 1
    @State var progressingScale: CGFloat = 1
    @State var isDragging: Bool = false;
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location
                
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                
                self.isDragging = true
                self.location = newLocation
            }.updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location
            }.onEnded { _ in
                self.isDragging = false
            }
    }
    
    var fingerDrag: some Gesture {
        DragGesture()
            .updating($fingerLocation) { (value, fingerLocation, transaction) in
                fingerLocation = value.location
            }
    }
    
    var magnification: some Gesture {
            MagnificationGesture()
                .onChanged { progressingScale = $0 }
                .onEnded {
                    magScale *= $0
                    progressingScale = 1
                }
    }

    var content: () -> Content

    var body: some View {
        content()
            .frame(width: 200, height: 200, alignment: .center)
            .scaleEffect(self.magScale * progressingScale)
            .position(location)
            .gesture(
                simpleDrag.simultaneously(with: fingerDrag)
            )
            .gesture(magnification)
            .foregroundStyle(.thinMaterial)
    }

}


