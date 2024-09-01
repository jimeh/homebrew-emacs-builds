# frozen_string_literal: true

cask 'emacs-app-monthly' do
  name 'Emacs'
  desc 'GNU Emacs text editor (monthly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '2024-09-01.92ea393.master'

  on_arm do
    sha256 '189b5b38ddaea998cbf31058cbf52440e3027dfe7cde06e8c49645397399e255'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2024-09-01.92ea393.master/Emacs.2024-09-01.92ea393.master.macOS-13.arm64.dmg'
    depends_on macos: '>= :ventura'
  end

  on_intel do
    sha256 'a92c7131bd2a48190e84285e29632c7fce58b2a17c6ed96605c48c120bd83f50'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2024-09-01.92ea393.master/Emacs.2024-09-01.92ea393.master.macOS-12.x86_64.dmg'
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
