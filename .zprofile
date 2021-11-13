export QT_QPA_PLATFORMTHEME="gtk2"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export TERMINAL=/usr/bin/alacritty
export TERM=xterm-256color

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/jre/"
export PATH="$JDK_HOME$PATH"

export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

export GOBIN="$HOME/go/bin"
export GO111MODULE=auto
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

export CHROME_EXECUTABLE='/opt/google/chrome/google-chrome'
. "$HOME/.cargo/env"

