import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Foto de perfil placeholder
                    VStack(spacing: 12) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.green)

                        Text("Simon Franco")
                            .font(.title)
                            .fontWeight(.bold)

                        Text("Psicologo y Analista de Conducta")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top)

                    // Bio
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Sobre Mi")
                            .font(.headline)

                        Text("Soy Simon Franco, psicologo y analista de conducta especializado en nutricion y microbiota. Me apasiona explorar la relacion entre la salud fisica, mental y los avances en medicina funcional. Este blog es un espacio para compartir ideas y aprender juntos.")
                            .font(.body)
                            .lineSpacing(4)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)

                    // Especialidades
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Especialidades")
                            .font(.headline)

                        VStack(spacing: 8) {
                            SpecialtyRow(icon: "brain.head.profile", title: "Salud Mental", description: "Analisis de conducta y bienestar psicologico")
                            SpecialtyRow(icon: "leaf.fill", title: "Nutricion", description: "Alimentacion funcional y suplementacion")
                            SpecialtyRow(icon: "waveform.path.ecg", title: "Microbiota", description: "Eje intestino-cerebro y probioticos")
                            SpecialtyRow(icon: "heart.text.square", title: "Medicina Funcional", description: "Enfoque integrativo de la salud")
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)

                    // Version de la app
                    VStack(spacing: 4) {
                        Text("AbaSensei v1.0")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("2024 Simon Franco. Todos los derechos reservados.")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top)
                }
                .padding()
            }
            .navigationTitle("Sobre Mi")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SpecialtyRow: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.green)
                .frame(width: 40, height: 40)
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }
}

#Preview {
    AboutView()
}
