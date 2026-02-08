import SwiftUI

struct BlogPostView: View {
    let post: BlogPost

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header con icono
                HStack {
                    Image(systemName: post.imageSystemName)
                        .font(.system(size: 40))
                        .foregroundStyle(.green)
                        .frame(width: 70, height: 70)
                        .background(Color.green.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(post.category.uppercased())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.green.opacity(0.1))
                            .clipShape(Capsule())

                        Text(post.date, style: .date)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("Por Simon Franco")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                // Titulo
                Text(post.title)
                    .font(.title2)
                    .fontWeight(.bold)

                Divider()

                // Contenido
                Text(post.content)
                    .font(.body)
                    .lineSpacing(6)
                    .foregroundStyle(.primary)

                Divider()

                // Footer
                HStack {
                    Label("Compartir", systemImage: "square.and.arrow.up")
                    Spacer()
                    Label("Guardar", systemImage: "bookmark")
                }
                .font(.subheadline)
                .foregroundStyle(.green)
            }
            .padding()
        }
        .navigationTitle("Articulo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BlogPostView(post: VehicleDatabase.getBlogPosts()[0])
    }
}
