import SwiftUI

/// Представление SwiftUI, которое отображает сетку с днями вкладов.
/// Каждый день отображается в виде квадрата с цветом, зависящим от уровня вклада.
struct ContributionGrid: View {
    /// ViewModel, который предоставляет список дней с вкладом.
    @ObservedObject var viewModel: ContributionGridViewModel
    
    /// Расстояние между элементами в сетке.
    private let spacing: CGFloat = 4
    /// Размер каждого элемента в сетке.
    private let itemHeight: CGFloat = 15
    
    var body: some View {
        let rows = Array(repeating: GridItem(.fixed(15), spacing: 4), count: 7)
        LazyHGrid(
            rows: rows,
            spacing: spacing
        ) {
            ForEach(
                viewModel.paddedContributions.indices,
                id: \.self
            ) { index in
                if let day = viewModel.paddedContributions[index] {
                    Rectangle()
                        .fill(color(for: day.level))
                        .frame(width: itemHeight, height: itemHeight)
                        .cornerRadius(3)
                } else {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: itemHeight, height: itemHeight)
                }
            }
        }
        .padding(4)
    }
    
    /// Возвращает цвет для заданного уровня вклада.
    /// - Параметр level: Уровень вклада.
    /// - Возвращает: Цвет, соответствующий уровню вклада.
    private func color(for level: Int) -> Color {
        switch level {
        case 0: return Color.gray.opacity(0.3)
        case 1: return Color.green.opacity(0.4)
        case 2: return Color.green.opacity(0.6)
        case 3: return Color.green.opacity(0.8)
        case 4: return Color.green
        default: return Color.gray.opacity(0.1)
        }
    }
}

/// Провайдер предварительного просмотра для представления ContributionGrid.
#Preview {
    let testData: [ContributionDay] = {
        let startDate = Calendar.current.date(byAdding: .day, value: -364, to: Date())!
        return (0..<365).map { i in
            let date = Calendar.current.date(byAdding: .day, value: i, to: startDate)!
            return ContributionDay(date: date, level: Int.random(in: 0...4))
        }
    }()
    
    return ScrollView(.horizontal) {
        ContributionGrid(viewModel: ContributionGridViewModel(contributions: testData))
    }
}
