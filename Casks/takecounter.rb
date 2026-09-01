cask "takecounter" do
  version "1.5.1"
  sha256 "dc30b7018bfa630ad32d796222aa078e022a35ae69d66866338fbbb967def40a"

  url "https://takecounter.app/TakeCounter-#{version}.zip"
  name "Take Counter"
  desc "Take-number and remaining-record-time display for recording sessions"
  homepage "https://takecounter.app/"

  # The changelog lists releases newest-first; the poster numeral is the version.
  livecheck do
    url "https://takecounter.app/changelog"
    regex(%r{class="ver"[^>]*>\s*v?(\d+(?:\.\d+)+)\s*<}i)
  end

  depends_on macos: :ventura

  app "TakeCounter.app"

  # NOTE: Application Support holds the purchased license file (takecounter.license) —
  # zap is the deliberate deep-clean, so it goes too; reinstallers can re-download
  # their license from their receipt link.
  zap trash: [
    "~/Library/Preferences/wtf.adhd.takecounter.plist",
    "~/Library/Application Support/TakeCounter",
  ]
end
