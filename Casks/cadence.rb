cask "cadence" do
  version "0.4.0"
  sha256 "10c2207d8e6b53411a5dc412a4db9bccb9f1800e156ff84506bfbbcb09d2c1e5"

  url "https://github.com/Hoshi-Corp/cadence/releases/download/v#{version}/Cadence-#{version}.zip"
  name "Cadence"
  desc "Menu bar Pomodoro timer with break reminders and a Markdown work log"
  homepage "https://github.com/Hoshi-Corp/cadence"

  depends_on macos: :sonoma

  app "Cadence.app"

  # Ad-hoc signed, not notarized, so Gatekeeper would block it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Cadence.app"],
        writable_paths: ["{{appdir}}/Cadence.app"]
  end

  uninstall quit: "com.masaruhoshi.cadence"

  # The Markdown work log in ~/Documents/Cadence is user data and is kept.
  zap trash: [
    "~/Library/Application Support/Cadence",
    "~/Library/Preferences/com.masaruhoshi.cadence.plist",
  ]
end
