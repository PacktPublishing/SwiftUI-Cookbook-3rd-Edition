//
//  ContentView.swift
//  GoogleLogin
//
//  Created by Juan Catalan on 8/18/23.
//

/*
 
 Don't forget to add your GoogleService-Info.plist to the project and add the custom url scheme or the app won't work
 
 */

import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift

extension UIApplication {
    static var currentRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow })
            .first?
            .rootViewController
    }
}

@Observable final class AuthenticationViewModel {
    enum State {
        case busy
        case signedIn
        case signedOut
    }
    
    var state: State = .busy
    private var authResult: AuthDataResult? = nil
    var username: String { authResult?.user.displayName ?? "" }
    var email: String { authResult?.user.email ?? "" }
    var photoURL: URL? { authResult?.user.photoURL }
    
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.disconnect()
        try? Auth.auth().signOut()
        authResult = nil
        state = .signedOut
    }
    
    func restorePreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error { print("Error: \(error.localizedDescription)") }
            Task {
                await self.signIn(user: user)
            }
        }
    }
    
    func login() {
        state = .busy
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let rootViewController = UIApplication.currentRootViewController else {
            return
        }
        let configuration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configuration
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil) { result, error in
            if let error { print("Error: \(error.localizedDescription)") }
            Task {
                await self.signIn(user: result?.user)
            }
        }
    }
    
    private func signIn(user: GIDGoogleUser?) async {
        guard let user, let idToken = user.idToken else {
            state = .signedOut
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                       accessToken: user.accessToken.tokenString)
        do {
            authResult = try await Auth.auth().signIn(with: credential)
            state = .signedIn
        } catch {
            state = .signedOut
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct ProfileView: View {
    var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: authenticationViewModel.photoURL) { image in
                image
                    .resizable()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            Text("User: \(authenticationViewModel.username)")
                .foregroundColor(.black)
            Text("Email: \(authenticationViewModel.email)")
                .foregroundColor(.black)
            Button("Logout") {
                authenticationViewModel.logout()
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 30, alignment: .center)
            .padding(.top, 10)
        }
    }
}

struct ContentView: View {
    @State var authenticationViewModel = AuthenticationViewModel()
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            switch authenticationViewModel.state {
            case .busy:
                ProgressView()
            case .signedIn:
                ProfileView(authenticationViewModel: authenticationViewModel)
            case .signedOut:
                GoogleSignInButton(action: authenticationViewModel.login)
                    .frame(width: 150, height: 30, alignment: .center)
            }
        }
        .task {
            authenticationViewModel.restorePreviousSignIn()
        }
    }
}

#Preview {
    ContentView()
}
