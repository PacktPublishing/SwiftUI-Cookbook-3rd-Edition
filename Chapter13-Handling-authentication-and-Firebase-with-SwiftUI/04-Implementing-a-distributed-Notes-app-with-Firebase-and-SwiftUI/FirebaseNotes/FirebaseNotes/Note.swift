//
//  Note.swift
//  FirebaseNotes
//
//  Created by Juan Catalan on 8/21/23.
//

import Foundation

struct Note: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let date: Date
    let body: String
}

extension Note {
    static let sample = Note(id: UUID().uuidString,
                             title: "Sample Title",
                             date: Date(),
                             body: "Sample Body")

    // body text generated with: https://loremipsum.io
    static let sampleWithLongBody = Note(id: UUID().uuidString,
                                         title: "Sample Title",
                                         date: Date(),
                                         body:
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget. Arcu bibendum at varius vel pharetra vel turpis nunc. Et tortor at risus viverra adipiscing at in tellus. Enim lobortis scelerisque fermentum dui. Sagittis aliquam malesuada bibendum arcu. Elementum nibh tellus molestie nunc. Orci nulla pellentesque dignissim enim sit amet venenatis urna cursus. Bibendum est ultricies integer quis auctor elit sed vulputate. Nibh praesent tristique magna sit amet purus gravida quis blandit. In ornare quam viverra orci sagittis eu volutpat. Posuere morbi leo urna molestie at elementum. Feugiat scelerisque varius morbi enim. Enim neque volutpat ac tincidunt vitae semper. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Consequat ac felis donec et odio.
        
        Nullam vehicula ipsum a arcu cursus vitae congue mauris. Interdum velit euismod in pellentesque massa placerat duis ultricies. Eu volutpat odio facilisis mauris sit. Ac auctor augue mauris augue neque gravida. Nam libero justo laoreet sit. Lacus luctus accumsan tortor posuere ac. Nulla porttitor massa id neque. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras. Ipsum dolor sit amet consectetur adipiscing elit ut. Aenean sed adipiscing diam donec adipiscing tristique risus. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Tellus orci ac auctor augue mauris augue neque gravida in. Tellus at urna condimentum mattis pellentesque id nibh tortor. Tempus quam pellentesque nec nam aliquam sem et tortor consequat. Facilisis volutpat est velit egestas dui id. Lorem dolor sed viverra ipsum nunc aliquet bibendum.
        
        Cursus risus at ultrices mi tempus imperdiet. Habitasse platea dictumst quisque sagittis purus sit amet volutpat consequat. Fames ac turpis egestas sed tempus urna. Nulla aliquet enim tortor at auctor urna. Et ligula ullamcorper malesuada proin libero nunc. Feugiat nisl pretium fusce id velit ut. Id faucibus nisl tincidunt eget nullam non nisi est. Neque egestas congue quisque egestas diam. Nisl tincidunt eget nullam non nisi est. Dolor sit amet consectetur adipiscing elit. At lectus urna duis convallis convallis tellus id interdum velit. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec. Semper eget duis at tellus at urna. Diam in arcu cursus euismod quis.
        
        Adipiscing bibendum est ultricies integer quis auctor. Tincidunt ornare massa eget egestas purus viverra accumsan. Nunc id cursus metus aliquam eleifend mi. Blandit turpis cursus in hac habitasse platea dictumst. Pellentesque pulvinar pellentesque habitant morbi. In hendrerit gravida rutrum quisque non tellus orci ac. Vulputate mi sit amet mauris commodo quis imperdiet massa. Vivamus at augue eget arcu dictum varius duis at consectetur. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Gravida dictum fusce ut placerat orci nulla. Nisi est sit amet facilisis magna etiam.
        
        Vel orci porta non pulvinar neque laoreet. Tincidunt lobortis feugiat vivamus at augue eget. Senectus et netus et malesuada fames ac turpis. Euismod quis viverra nibh cras pulvinar mattis nunc sed blandit. Feugiat in fermentum posuere urna. Malesuada pellentesque elit eget gravida cum. Pulvinar mattis nunc sed blandit libero volutpat sed cras ornare. Eu ultrices vitae auctor eu augue ut lectus arcu bibendum. Congue quisque egestas diam in arcu cursus euismod quis viverra. Pretium quam vulputate dignissim suspendisse in est ante in nibh.
        """
    )
}
