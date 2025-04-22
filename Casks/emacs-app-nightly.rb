# frozen_string_literal: true

cask 'emacs-app-nightly' do
  name 'Emacs'
  desc 'GNU Emacs text editor (nightly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '2025-04-22.add8bf0.master'

  on_arm do
    sha256 '7d8992fda8fb346e002a336929fbe3b924d7758553af8c47739d8b0bd4c47dff'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2025-04-22.add8bf0.master/Emacs.2025-04-22.add8bf0.master.macOS-11.arm64.dmg'
    depends_on macos: '>= :big_sur'
  end
  on_intel do
    sha256 '9c7d681d020df6e67e2a6abb18b026d960e3addb64a06708d4d3190f07232c84'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2025-04-22.add8bf0.master/Emacs.2025-04-22.add8bf0.master.macOS-11.x86_64.dmg'
    depends_on macos: '>= :big_sur'
  end

  livecheck do
    url 'https://github.com/jimeh/emacs-builds.git'
    strategy :git do |tags|
      tags.map do |tag|
        m = /^Emacs\.(\d{4}-\d{2}-\d{2}\.\w+\.master)$/.match(tag)
        next unless m

        m[1]
      end.compact
    end
  end

  conflicts_with(
    cask: %w[
      emacs-app
      emacs-app-good
      emacs-app-monthly
      emacs-app-nightly-28
      emacs-app-nightly-29
      emacs-app-pretest
      emacs
      emacs-nightly
      emacs-pretest
      emacs-mac
      emacs-mac-spacemacs-icon
    ],
    formula: %w[
      emacs
      emacs-mac
    ]
  )

  app 'Emacs.app'
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacs"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"
  binary "#{appdir}/Emacs.app/Contents/Resources/include/emacs-module.h",
         target: "#{HOMEBREW_PREFIX}/include/emacs-module.h"
  binary "#{appdir}/Emacs.app/Contents/Resources/site-lisp/subdirs.el",
         target: "#{HOMEBREW_PREFIX}/share/emacs/site-lisp/subdirs.el"

  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/ebrowse.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacs.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacsclient.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/etags.1.gz"

  zap trash: [
    '~/Library/Caches/org.gnu.Emacs',
    '~/Library/Preferences/org.gnu.Emacs.plist',
    '~/Library/Saved Application State/org.gnu.Emacs.savedState'
  ]
end
