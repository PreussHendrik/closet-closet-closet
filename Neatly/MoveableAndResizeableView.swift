import SwiftUI



struct MovableResizableView<Content>: View where Content: View {
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    

    @GestureState private var dragState = DragState.inactive

    @State private var currentScale: CGFloat = 0

    @State private var finalScale: CGFloat = 1

    @State var width: CGFloat = 150

    @State var height: CGFloat = 150

    @State private var newPosition: CGSize = .zero

    @State private var isDragging = false
    

    var content: () -> Content

    

    var body: some View {

        content()

            //.opacity(dragState.isPressing ? 0.5 : 1.0)

            .scaleEffect(finalScale + currentScale)

            .offset(x: dragState.translation.width + newPosition.width, y: dragState.translation.height + self.newPosition.height)

            .animation(Animation.easeInOut(duration: 0.1), value: 0)

            .gesture(LongPressGesture(minimumDuration: 1.0)

                        .sequenced(before: DragGesture())

                        .updating($dragState, body: { (value, state, transaction) in



                switch value {

                case .first(true):

                    state = .pressing

                case .second(true, let drag):

                    state = .dragging(translation: drag?.translation ?? .zero)

                default:

                    break

                }



            })

                        .onEnded({ (value) in



                guard case .second(true, let drag?) = value else {

                    return

                }



                self.newPosition.height += drag.translation.height

                self.newPosition.width += drag.translation.width

            }))

            .gesture(MagnificationGesture()

                        .onChanged{ newScale in

                currentScale = newScale

            }

                        .onEnded { scale in

                finalScale = scale

                currentScale = 0

            })

            

        

    }

}


