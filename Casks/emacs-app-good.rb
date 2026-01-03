# frozen_string_literal: true

cask 'emacs-app-good' do
  name 'Emacs'
  desc 'GNU Emacs text editor (known good nightly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '2025-09-14.897d322.master'

  on_arm do
    sha256 'a1824d28f27b4d738303729dadbb66ede5ca2711ff4a313009061c880a44669e'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2025-09-14.897d322.master/Emacs.2025-09-14.897d322.master.macOS-11.arm64.dmg'
    depends_on macos: '>= :big_sur'
  end
  on_intel do
    sha256 '65947b70a5af300c26e6cbaf7f9cd40fe1e4ee4fc7add60e987ddf1d4fb0a4ac'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2025-09-14.897d322.master/Emacs.2025-09-14.897d322.master.macOS-11.x86_64.dmg'
    depends_on macos: '>= :big_sur'
  end

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
