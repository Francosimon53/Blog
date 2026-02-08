import SwiftUI

struct ContactView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var showAlert = false

    var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
        !message.trimmingCharacters(in: .whitespaces).isEmpty &&
        email.contains("@")
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "envelope.circle.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.green)
                        Text("Contacto")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Enviame un mensaje y te respondere a la brevedad")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top)

                    // Formulario
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 6) {
                            Label("Nombre", systemImage: "person")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            TextField("Tu nombre", text: $name)
                                .textFieldStyle(.roundedBorder)
                                .textContentType(.name)
                        }

                        VStack(alignment: .leading, spacing: 6) {
                            Label("Correo Electronico", systemImage: "envelope")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            TextField("tu@email.com", text: $email)
                                .textFieldStyle(.roundedBorder)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                        }

                        VStack(alignment: .leading, spacing: 6) {
                            Label("Mensaje", systemImage: "text.bubble")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            TextEditor(text: $message)
                                .frame(minHeight: 120)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                        Button(action: sendMessage) {
                            HStack {
                                Image(systemName: "paperplane.fill")
                                Text("Enviar Mensaje")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? Color.green : Color.gray)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .disabled(!isFormValid)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)

                    // Info adicional
                    VStack(spacing: 12) {
                        ContactInfoRow(icon: "globe", title: "Web", value: "abasensei.app")
                        ContactInfoRow(icon: "envelope.fill", title: "Email", value: "contacto@abasensei.app")
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
                }
                .padding()
            }
            .navigationTitle("Contacto")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Mensaje Enviado", isPresented: $showAlert) {
                Button("OK") {
                    name = ""
                    email = ""
                    message = ""
                }
            } message: {
                Text("Gracias por tu mensaje. Te responderemos pronto.")
            }
        }
    }

    private func sendMessage() {
        showAlert = true
    }
}

struct ContactInfoRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.green)
                .frame(width: 30)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

#Preview {
    ContactView()
}
