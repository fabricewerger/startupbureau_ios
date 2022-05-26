//
//  ChatroomView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 08/01/2022.
//

import SwiftUI

struct Chatroomiew: View {
    
    @Binding var homeNavigationChatFlow: Bool
    
    var body: some View {
        
        Chat(homeNavigationChatFlow: $homeNavigationChatFlow)
    }
}

struct Chatroomiew_Previews: PreviewProvider {
    static var previews: some View {
        Chatroomiew(homeNavigationChatFlow: .constant(false))
    }
}

struct Chat : View {
    
    @Binding var homeNavigationChatFlow: Bool
    
    @State var message = ""
    @State var imagePicker = false
    @State var imgData : Data = Data(count: 0)
    
    //StateObject is the owner of the object....
    
    @StateObject var allMessages = Messages()
    
    var body: some View{
        
        VStack{
            
            ZStack{
                
                
                HStack{
                    
                    //                    Button(action: {}, label: {
                    //
                    //                        Image(systemName: "chevron.left")
                    //                            .font(.system(size: 22))
                    //                            .foregroundColor(.white)
                    //                    })
                    
                    // Navigation Link...
                    
                    
                    //                    NavigationLink {
                    //
                    //                       Home()
                    //
                    //
                    //                    } label: {
                    //
                    //                        Image("chevron-left")
                    //                            .resizable()
                    //                            .renderingMode(.template)
                    //                            .aspectRatio(contentMode: .fit)
                    //                            .frame(width: 22, height: 22)
                    //                            .foregroundColor(.white)
                    //                    }
                    //                    Button("") {
                    //                        self.homeNavigationChatFlow = false
                    //                    }
                    
                    
                    Button("Terug") {
                        self.homeNavigationChatFlow = false
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    
                    Spacer()
                    
                    //                    Button(action: {}, label: {
                    //
                    //                        Image(systemName: "gear")
                    //                            .font(.system(size: 22))
                    //                            .foregroundColor(.white)
                    //                    })
                }
                //
                VStack(spacing: 5){
                    
                    Text("StartupBureau")
                        .fontWeight(.bold)
                    
                    Text("Je kan ons alles vragen")
                        .font(.caption)
                }
                .foregroundColor(.white)
            }
            .padding(.all)
            .navigationBarBackButtonHidden(true)
            
            VStack{
                
                // Displaying Message....
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    ScrollViewReader{reader in
                        
                        VStack(spacing: 20){
                            
                            ForEach(allMessages.messages){msg in
                                
                                // Chat Bubbles...
                                
                                ChatBubble(msg: msg)
                            }
                            // when ever a new data is inserted scroll to bottom...
                            
                            .onChange(of: allMessages.messages) { (value) in
                                
                                // scrolling only user message...
                                
                                if value.last!.myMsg{
                                    
                                    reader.scrollTo(value.last?.id)
                                }
                            }
                        }
                        .padding([.horizontal,.bottom])
                        .padding(.top, 25)
                    }
                })
                
                HStack(spacing: 15){
                    
                    HStack(spacing: 15){
                        
                        TextField("Message", text: self.$message)
                        
                        Button(action: {
                            
                            // toogling image picker...
                            
                            imagePicker.toggle()
                            
                        }, label: {
                            
                            Image(systemName: "paperclip.circle.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                        })
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.06))
                    .clipShape(Capsule())
                    
                    // Send Button...
                    
                    // hiding view...
                    
                    if message != ""{
                        
                        Button(action: {
                            
                            // appeding message...
                            
                            // adding animation...
                            
                            withAnimation(.easeIn){
                                
                                allMessages.messages.append(Message(id: Date(), message: message, myMsg: true, profilePic: "me14", photo: nil))
                            }
                            
                            message = ""
                            
                        }, label: {
                            
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.accentColor)
                            // rotating the image...
                                .rotationEffect(.init(degrees: 45))
                            // adjusting padding shape...
                                .padding(.vertical,12)
                                .padding(.leading,12)
                                .padding(.trailing,17)
                                .background(Color.black.opacity(0.07))
                                .clipShape(Circle())
                        })
                    }
                }
                .padding(.horizontal)
                .animation(.easeOut)
            }
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white.clipShape(RoundedShape()))
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.accentColor.edgesIgnoringSafeArea(.top))
        .fullScreenCover(isPresented: self.$imagePicker, onDismiss: {
            
            if self.imgData.count != 0{
                
                allMessages.writeMessage(id: Date(), msg: "", photo: self.imgData, myMsg: true, profilePic: "me14")
            }
            
        }) {
            
            ImagePicker(imagePicker: self.$imagePicker, imgData: self.$imgData)
        }
    }
}

struct ChatBubble : View {
    
    var msg : Message
    var body: some View{
        
        HStack(alignment: .top,spacing: 10){
            
            if msg.myMsg{
                
                Spacer(minLength: 25)
                
                if msg.photo == nil{
                    
                    Text(msg.message)
                        .padding(.all)
                        .background(Color(asset: .accentColor2).opacity(0.5))
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }
                else{
                    
                    Image(uiImage: UIImage(data: msg.photo!)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 150, height: 150)
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }
                
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
            
            else{
                
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                if msg.photo == nil{
                    
                    Text(msg.message)
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color.accentColor.opacity(0.9))
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }
                else{
                    
                    Image(uiImage: UIImage(data: msg.photo!)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 150, height: 150)
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }
                
                
                Spacer(minLength: 25)
            }
        }
        .id(msg.id)
    }
}

struct BubbleArrow : Shape {
    
    var myMsg : Bool
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: myMsg ?  [.topLeft,.bottomLeft,.bottomRight] : [.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

struct RoundedShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

struct Message : Identifiable,Equatable{
    
    var id : Date
    var message : String
    var myMsg : Bool
    var profilePic : String
    var photo: Data?
    
}

class Messages : ObservableObject{
    
    @Published var messages : [Message] = []
    
    init() {
        
        let strings = ["test","Stel ons een vraag wanneer je iets niet snapt"]
        
        for i in 1..<strings.count{
            
            messages.append(Message(id: Date(), message: strings[i], myMsg: i % 2 == 0 ? true : false, profilePic: i % 2 == 0 ? "me14" : "app"))
        }
    }
    
    func writeMessage(id: Date,msg: String,photo: Data?,myMsg: Bool,profilePic: String){
        
        messages.append(Message(id: id, message: msg, myMsg: myMsg, profilePic: profilePic, photo: photo))
    }
}

struct ImagePicker : UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        
        return ImagePicker.Coordinator(parent1: self)
    }
    
    @Binding var imagePicker : Bool
    @Binding var imgData : Data
    
    func makeUIViewController(context: Context) -> UIImagePickerController{
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    class Coordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        var parent : ImagePicker
        
        init(parent1 : ImagePicker) {
            
            parent = parent1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            parent.imagePicker.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            parent.imgData = image.jpegData(compressionQuality: 0.5)!
            parent.imagePicker.toggle()
        }
    }
}
