struct WeekdayHeader: View {
    @StateObject var viewModel: WeekdayHeaderViewModel
    let itemSize: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            ForEach(viewModel.weekdays, id: \.self) { day in
                Text(day.prefix(2)) // Берем первые 2 буквы дня
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(height: itemSize)
            }
        }
    }
}