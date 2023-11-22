# frozen_string_literal: true

cask 'emacs-app' do
  name 'Emacs'
  desc 'GNU Emacs text editor'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '29.1'

  on_arm do
    sha256 'af65e90cb77c6995fd06f2248f84bbc09160b1aed9661813958317c2843b9e55'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-29.1/Emacs.2023-07-30.a9b2822.emacs-29-1.macOS-13.arm64.dmg'
    depends_on macos: '>= :ventura'
  end

  on_intel do
    sha256 '06975a567a038f557f88d865f438aa838a4da3a1771885b747bcd416cb85c67c'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-29.1/Emacs.2023-07-30.a9b2822.emacs-29-1.macOS-12.x86_64.dmg'
    depends_on macos: '>= :monterey'
  end

  livecheck do
    url 'https://github.com/jimeh/emacs-builds.git'
    strategy :git do |tags|
      tags.map do |tag|
        m = /^Emacs-(\d+\.\d+[a-z]*)$/.match(tag)
        next unless m

        m[1]
      end.compact
    end
  end

  conflicts_with(
    cask: %w[
      emacs-app-good
      emacs-app-monthly
      emacs-app-nightly
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
