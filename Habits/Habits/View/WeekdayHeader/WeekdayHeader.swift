import SwiftUI

/// Представление SwiftUI, которое отображает дни недели в вертикальном стеке.
/// Каждый день недели отображается в виде двухбуквенной аббревиатуры.
struct WeekdayHeader: View {

    /// ViewModel, который предоставляет список дней недели.
    @ObservedObject var viewModel: WeekdayHeaderViewModel
    /// Высота каждого элемента в списке.
    let itemHeigt: CGFloat
    /// Вертикальное между элементами в списке.
    let vertivalSpacing: CGFloat

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: vertivalSpacing
        ) {
            ForEach(
                viewModel.weekdays,
                id: \.self
            ) { day in
                Text(day.prefix(2)) // Берем первые 2 буквы дня
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(height: itemHeigt)
            }
        }
    }

}

/// Провайдер предварительного просмотра для представления WeekdayHeader.
#Preview {
    WeekdayHeader(
        viewModel: WeekdayHeaderViewModel(),
        itemHeigt: 15,
        vertivalSpacing: 4
    )
}
