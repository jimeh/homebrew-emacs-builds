# frozen_string_literal: true

cask 'emacs-app-pretest' do
  name 'Emacs'
  desc 'GNU Emacs text editor (latest pretest)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '30.1.90-pretest'

  on_arm do
    sha256 '7b83465eb5fd9cd9cecf3d318d154516ba0481e67957ddcc8669f43c53e80c53'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-30.1.90-pretest/Emacs.2025-05-18.1136aed.emacs-30-1-90-pretest.macOS-11.arm64.dmg'
    depends_on macos: '>= :big_sur'
  end
  on_intel do
    sha256 'e19f10777998947cd0267ea435345945c75660033e0885f7bd5b1666e0fb8f59'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs-30.1.90-pretest/Emacs.2025-05-18.1136aed.emacs-30-1-90-pretest.macOS-11.x86_64.dmg'
    depends_on macos: '>= :big_sur'
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
