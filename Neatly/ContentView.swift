import SwiftUI
import PDFKit


struct ContentView: View {
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                CanvasItem() {
                    Image("sieben")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("zwei")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("Sujet")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("eins")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("drei")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("vier")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("fuenf")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                CanvasItem() {
                    Image("sechs")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                /*if let fingerLocation = fingerLocation {
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 44, height: 44)
                        .position(fingerLocation)
                }
                
                if (false) {
                    ZStack {
                        RoundedRectangle(cornerRadius: .infinity)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.ultraThinMaterial)
                            .padding(15)
                        Text("🗑️")
                    }
                }*/
                
            
            }
            .background(Color(red: 255, green: 251, blue: 230))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            
            /*Button("Add new Item") {
                print("add item")
            }*/
        }
        .aspectRatio(0.55, contentMode: .fit)
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

