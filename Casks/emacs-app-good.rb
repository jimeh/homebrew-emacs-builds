# frozen_string_literal: true

cask 'emacs-app-good' do
  version '2022-04-10.48cb9c4.master'

  sha256 '5b5cffeecba5cafbcabc3e6d6858abc848223d21234b5f18b8a81dea99a2f1b1'
  url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2022-04-10.48cb9c4.master/Emacs.2022-04-10.48cb9c4.master.macOS-10-15.x86_64.dmg'

  name 'Emacs'
  desc 'GNU Emacs text editor (known good nightly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  livecheck do
    url 'https://github.com/jimeh/emacs-builds/issues/7'
    strategy :page_match do |page|
      page.scan(%r{href=.*?https://github\.com/jimeh/emacs-builds/releases/tag/Emacs\.(\d{4}-\d{2}-\d{2}\.\w+\.master)}i)
          .map { |match| match&.first }
    end
  end

  conflicts_with(
    cask: %w[
      emacs-app
      emacs-app-nightly
      emacs-app-nightly-28
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

  depends_on macos: '>= :catalina'

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