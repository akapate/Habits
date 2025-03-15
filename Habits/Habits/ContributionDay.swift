struct ContributionDay: Identifiable {
    let id = UUID()
    let date: Date
    let level: Int // 0 - серый, 1-4 - оттенки зеленого
}