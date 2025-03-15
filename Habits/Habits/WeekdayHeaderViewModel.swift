/// ViewModel для представления WeekdayHeader.
/// Управляет списком дней недели, начиная с понедельника.
class WeekdayHeaderViewModel: ObservableObject {
    /// Опубликованное свойство для хранения списка дней недели.
    @Published var weekdays: [String]

    /// Инициализирует ViewModel с текущим календарем.
    /// - Параметр calendar: Календарь для получения символов дней недели. По умолчанию используется текущий календарь.
    init(
        calendar: Calendar = .current
    ) {
        let allWeekdays = calendar.shortWeekdaySymbols // ["Sun", "Mon", ..., "Sat"]
        let mondayIndex = 1
        self.weekdays = Array(allWeekdays[mondayIndex...] + allWeekdays[..<mondayIndex])
    }
}