import PlaygroundSupport
import SwiftUI

// Create a listView with a failable imagage leveraging .map as a replacement to "if let" optional

struct Message: Identifiable {
  var id: UUID
  let message: String
  let imageName: String?

  init(message: String, imageName: String? = nil) {
    self.id = UUID()
    self.message = message
    self.imageName = imageName
  }
}

struct MessageStream: View {
  // simulate two instances of text messages
  let messages: [Message] = [
    Message(message: "You there?"),
    Message(message: "Yes! Here's a neat system image -> ", imageName: "cube.fill"),
    Message(message: "Cool, but I like this one better: ", imageName: "dot.radiowaves.left.and.right")
  ]
  var body: some View {
    List(messages) { msg  in
      HStack {
        
        Text(msg.message)
          .font(.subheadline)
        
        msg.imageName.map { Image(systemName: $0) }
        .padding()
          .foregroundColor(.blue)
      }
    }
  }
}
let msgStream = MessageStream().self
PlaygroundPage.current.liveView = UIHostingController(rootView: msgStream)


