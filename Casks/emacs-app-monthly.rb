# frozen_string_literal: true

cask 'emacs-app-monthly' do
  name 'Emacs'
  desc 'GNU Emacs text editor (monthly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '2024-06-01.9a2088b.master'

  on_arm do
    sha256 '434ade7271ba7e9a9039647e608be5219d41730b8485c3a3758174578d2dddd7'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2024-06-01.9a2088b.master/Emacs.2024-06-01.9a2088b.master.macOS-13.arm64.dmg'
    depends_on macos: '>= :ventura'
  end

  on_intel do
    sha256 'e9f0c3add0c274fb975a141310beb8ae2243774eea6826874d348007e61e388d'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2024-06-01.9a2088b.master/Emacs.2024-06-01.9a2088b.master.macOS-12.x86_64.dmg'
    depends_on macos: '>= :monterey'
  end

  livecheck do
    url 'https://github.com/jimeh/emacs-builds.git'
    strategy :git do |tags|
      tags.map do |tag|
        m = /^Emacs\.(\d{4}-\d{2}-01\.\w+\.master)$/.match(tag)
        next unless m

        m[1]
      end.compact
    end
  end

  conflicts_with(
    cask: %w[
      emacs-app
      emacs-app-good
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
