# frozen_string_literal: true

cask 'emacs-app-good' do
  version '2023-05-30.ecc1d99.master'

  sha256 '4941b57bcab80bf7f5bcdbd3908c6e90bb754c6a37cc98d0b183ed254af65c40'
  url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2023-05-30.ecc1d99.master/Emacs.2023-05-30.ecc1d99.master.macOS-11.x86_64.dmg'

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

  depends_on macos: '>= :big_sur'

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
