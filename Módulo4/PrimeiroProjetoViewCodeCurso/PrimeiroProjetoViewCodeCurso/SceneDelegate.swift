//
//  SceneDelegate.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // O AppDelegate é responsável pelo ciclo de vida e configuração do aplicativo ao ser startado.
    
    // O SceneDelegate é responsável pelo o que é mostrado na tela(visualização), e com ele, podemos manipular e gerenciar a forma como o aplicativo realmente é EXIBIDO.
    
    // Este método irá criar uma nova UIWindow, e definir o controlador de visualização raiz(root) e tornar a window a janela principal a ser exibida:
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }  // windowScene é uma propriedade que utilizamos para que ele realmente faça referência para nossa própria window
        let window = UIWindow(windowScene: windowScene)
        
        // Abordagem sem NavigationController:
        let vc: LoginVC = LoginVC()  // Criando a instância de nossa própria ViewController()
        window.rootViewController = vc  // Definindo nossa própria ViewController como rootViewController

//        // Abordagem com NavigationController
//        let vc: LoginVC = LoginVC()
//        let nav = UINavigationController(rootViewController: vc)  // Definindo a LoginVC como a primeira screen da NavigationController
//        window.rootViewController = nav
        
        window.makeKeyAndVisible()  // Estamos falando para o window: "faça sua devida criação, estou autorizando você a realmente montar nossa tela e fazer suas devidas atribuições"
        
        self.window = window  // Nossa window "master", já criada pelo através do compilador recebe nossa window criada aqui, com todas as suas configurações.
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

