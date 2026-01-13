# frozen_string_literal: true

cask 'emacs-app-nightly' do
  name 'Emacs'
  desc 'GNU Emacs text editor (nightly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '2026-01-12.ec3ade2.master'

  on_arm do
    sha256 '294025f1d59e65e4412ae24f30274a8366f485130c4f96835a39810b88f03935'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2026-01-12.ec3ade2.master/Emacs.2026-01-12.ec3ade2.master.macOS-11.arm64.dmg'
    depends_on macos: '>= :big_sur'
  end
  on_intel do
    sha256 'a3457bf1564856b3413c080fb5fd729501d5db3bdc3faaf3e033c71d444c5d36'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2026-01-12.ec3ade2.master/Emacs.2026-01-12.ec3ade2.master.macOS-11.x86_64.dmg'
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
