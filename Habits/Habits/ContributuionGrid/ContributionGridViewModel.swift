//
//  ContributionGridViewModel.swift
//  Habits
//
//  Created by Паша Петренко on 3/15/25.
//


/// ViewModel для представления ContributionGrid.
/// Управляет списком дней с вкладом и добавляет отступы для правильного отображения в сетке.
class ContributionGridViewModel: ObservableObject {
    
    /// Опубликованное свойство для хранения списка дней с вкладом.
    @Published var contributions: [ContributionDay]
    
    /// Календарь для вычислений.
    private let calendar: Calendar
    
    /// Инициализирует ViewModel с заданным календарем и списком дней с вкладом.
    /// - Параметр calendar: Календарь для вычислений. По умолчанию используется текущий календарь.
    /// - Параметр contributions: Список дней с вкладом.
    init(
        calendar: Calendar = .current,
        contributions: [ContributionDay]
    ) {
        self.calendar = calendar
        self.contributions = contributions
    }
    
    /// Возвращает список дней с вкладом, дополненный nil для правильного отображения в сетке.
    var paddedContributions: [ContributionDay?] {
        guard let firstDate = contributions.first?.date else { return contributions.map { Optional($0) } }
        let weekday = calendar.component(.weekday, from: firstDate) // 1 - воскресенье, 2 - понедельник, ..., 7 - суббота
        let shift = (weekday + 5) % 7 // Переводим в формат (0 - понедельник, 6 - воскресенье)
        return Array(repeating: nil, count: shift) + contributions.map { Optional($0) }
    }
    
}