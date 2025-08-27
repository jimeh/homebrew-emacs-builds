# frozen_string_literal: true

cask 'emacs-app-good' do
  name 'Emacs'
  desc 'GNU Emacs text editor (known good nightly build)'
  homepage 'https://github.com/jimeh/emacs-builds'

  version '2025-06-27.a132ca9.master'

  on_arm do
    sha256 'a057f46bc0e896297b1e4a7fff1c191c5e4e4f69c0727c247432919ee3fb1e72'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2025-06-27.a132ca9.master/Emacs.2025-06-27.a132ca9.master.macOS-11.arm64.dmg'
    depends_on macos: '>= :big_sur'
  end
  on_intel do
    sha256 '5288150acbe439fe5b468e996490f91152eb99b5a0877b26b9a1c608583fe611'
    url 'https://github.com/jimeh/emacs-builds/releases/download/Emacs.2025-06-27.a132ca9.master/Emacs.2025-06-27.a132ca9.master.macOS-11.x86_64.dmg'
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
