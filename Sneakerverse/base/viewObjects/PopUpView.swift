//
//  PopUpView.swift
//  Sneakerverse
//
//  Created by Dung  on 09.12.20.
//

import SwiftUI

struct PopUpView: View {
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            VStack(spacing: 25){
                Image(systemName: "photo.fill")
                
                Text("Congratulation!")
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("you have successfully offered your sneaker!")
            }
            .padding(.vertical,25)
            .padding(.horizontal,25)
            .background(BlurView())
            .cornerRadius(25)
            
            Button(action: {
                show.toggle()
            }){
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28,weight: .bold))
                    .foregroundColor(.blue)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(show: .constant(true) )
    }
}


struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
