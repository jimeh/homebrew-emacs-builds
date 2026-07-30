# frozen_string_literal: true

cask 'emacs-app-pretest' do
  name 'Emacs'
  desc 'GNU Emacs text editor (latest pretest)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '31.0.91-pretest'

  on_arm do
    sha256 '5af0768ef9a7bda58560cbbbda070664b21a331bb08553117d3b791ce4d57762'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-31.0.91-pretest/Emacs.2026-07-23.57581b8.emacs-31-0-91-pretest.macOS-11.arm64.dmg'
    depends_on macos: :big_sur
  end
  on_intel do
    sha256 'faccfa1fca7deb8d2b5f4fbbb4b991d56273a719c80d0921ec22a9eb1d6f5433'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-31.0.91-pretest/Emacs.2026-07-23.57581b8.emacs-31-0-91-pretest.macOS-11.x86_64.dmg'
    depends_on macos: :big_sur
  end

  livecheck do
    url 'https://github.com/jimeh/emacs-builds.git'
    strategy :git do |tags|
      tags.map do |tag|
        m = /^Emacs-(.+-pretest(-\d+)?)$/.match(tag)
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
