cask "cadence" do
  version "0.2.0"
  sha256 "f041cbbe6c03f0cb360f68d51e757b32f58169653528f497cbb40be8e7c12327"

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
