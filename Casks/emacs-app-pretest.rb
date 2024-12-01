# frozen_string_literal: true

cask 'emacs-app-pretest' do
  name 'Emacs'
  desc 'GNU Emacs text editor (latest pretest)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '30.0.92-pretest'

  on_arm do
    sha256 '27b4502b994f50395bebe4ca071a51bbd0a7474923fa5b289140634df0883b25'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-30.0.92-pretest/Emacs.2024-10-26.ed1d691.emacs-30-0-92-pretest.macOS-11.arm64.dmg'
    depends_on macos: '>= :big_sur'
  end
  on_intel do
    sha256 '8b4c1bcc22efec82332aec5f434d82f39cb88e4385278c1f30bf9264cc62a80a'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-30.0.92-pretest/Emacs.2024-10-26.ed1d691.emacs-30-0-92-pretest.macOS-11.x86_64.dmg'
    depends_on macos: '>= :big_sur'
  end

  livecheck do
    url 'https://github.com/jimeh/emacs-builds.git'
    strategy :git do |tags|
      tags.map do |tag|
        m = /^Emacs-(.+-pretest)$/.match(tag)
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
      emacs-app-nightly
      emacs-app-nightly-28
      emacs-app-nightly-29
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
