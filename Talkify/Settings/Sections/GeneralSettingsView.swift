import SwiftUI

/// The General section: app-wide behaviour that is not tied to any one
/// feature.
struct GeneralSettingsView: View {
  let launchAtLogin: LaunchAtLoginService

  var body: some View {
    SettingsCard(title: "Startup") {
      SettingsRow(
        title: "Launch at login",
        description: "Open Talkify automatically when you sign in"
      ) {
        Toggle("", isOn: launchAtLoginBinding)
          .labelsHidden()
          .toggleStyle(.switch)
      }
    }
  }

  private var launchAtLoginBinding: Binding<Bool> {
    Binding(
      get: { launchAtLogin.isEnabled },
      set: { launchAtLogin.setEnabled($0) }
    )
  }
}
