//
//  MoviesUseCase.swift
//  Domain
//
//  Created by Sumra Aarif on 2019/11/25.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Foundation
import RxSwift

public protocol MoviesUseCase {
    func movies() -> Observable<[Movie]>
}
