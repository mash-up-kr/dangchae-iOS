//
//  DiaryRouter.swift
//  DangChaeApp
//
//  Created by dongyoung.lee on 2021/03/12.
//

import RIBs

protocol DiaryInteractable: Interactable {
    var router: DiaryRouting? { get set }
    var listener: DiaryListener? { get set }
}

protocol DiaryViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DiaryRouter: ViewableRouter<DiaryInteractable, DiaryViewControllable>, DiaryRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: DiaryInteractable, viewController: DiaryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
