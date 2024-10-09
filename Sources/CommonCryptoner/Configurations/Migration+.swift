//
//  Migration+.swift
//
//
//  Created by Alexander Skibin on 09.10.2024.
//

import Vapor
import Fluent

/// Интерфейс поведения конфигурации миграций
public protocol MigratorBehavior {
    
    /// Конфигурация Enum моделей
    /// - Returns: Массив моделей миграции
    func configureEnums() -> [Migration]
    
    /// Конфигурация  моделей сущностей
    /// - Returns: Массив моделей миграции
    func configureModels() -> [Migration]
    
}
