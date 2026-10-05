cask "cadence" do
  version "0.3.0"
  sha256 "20de1665c524ab3e7a3e3451f37982792d83e64d50cf63f43bea0e5b838357d7"

  url "https://github.com/Hoshi-Corp/cadence/releases/download/v#{version}/Cadence-#{version}.zip"
  name "Cadence"
  desc "Menu bar Pomodoro timer with break reminders and a Markdown work log"
  homepage "https://github.com/Hoshi-Corp/cadence"

  depends_on macos: ">= :sonoma"

  app "Cadence.app"

  # Ad-hoc signed, not notarized, so Gatekeeper would block it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cadence.app"]
  end

  uninstall quit: "com.masaruhoshi.cadence"

  # The Markdown work log in ~/Documents/Cadence is user data and is kept.
  zap trash: [
    "~/Library/Application Support/Cadence",
    "~/Library/Preferences/com.masaruhoshi.cadence.plist",
  ]
end
