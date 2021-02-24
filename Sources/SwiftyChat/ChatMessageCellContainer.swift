//
//  MessageCell.swift
//  SwiftyChatbot
//
//  Created by Enes Karaosman on 18.05.2020.
//  Copyright © 2020 All rights reserved.
//

import SwiftUI

internal struct ChatMessageCellContainer<Message: ChatMessage>: View {
    
    public let message: Message
    public let size: CGSize
    
    public let onQuickReplyItemSelected: (QuickReplyItem) -> Void
    public let onTextTappedCallback: () -> AttributedTextTappedCallback
    public let onCarouselItemAction: (CarouselItemButton, Message) -> Void
    
    @ViewBuilder private func messageCell() -> some View {
        switch message.messageKind {
            
        case .text(let text):
            TextCell(
                text: text,
                message: message,
                size: size,
                callback: onTextTappedCallback
            )
            
        case .image(let imageLoadingType):
            ImageCell(
                message: message,
                imageLoadingType: imageLoadingType,
                size: size
            )
            
        case .quickReply(let quickReplies):
            QuickReplyCell(
                quickReplies: quickReplies,
                quickReplySelected: onQuickReplyItemSelected
            )
            
        case .carousel(let carouselItems):
            CarouselCell(
                carouselItems: carouselItems,
                size: size,
                message: message,
                onCarouselItemAction: onCarouselItemAction
            )
            
        }
        
    }
    
    public var body: some View {
        messageCell()
    }
    
}
