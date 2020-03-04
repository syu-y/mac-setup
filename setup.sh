#!/bin/bash

# コマンドの確認
function command_exists {
  command -v "$1" > /dev/null;
}

# Homebrew
# 各種ツールのインスール用
if ! command_exists brew ; then
  echo " ======== Homebrew ========"
  # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew update
  brew upgrade --all --cleanup
  brew -v
  echo " ========= END ========="
fi


# MAS(Mac App Store apps)
# App storeで公開されているアプリのインスール用
if ! command_exists mas ; then
  echo " === Mac App Store apps ==="
  brew install mas
  mas install 497799835  # Xcode (11.3)
  echo " ========= END ========="
fi

# Git
# Gitの導入
if ! command_exists git ; then
  echo " ========= Git ========="
  brew install git
  git --version
  echo " ========= END ========="
fi

# Node.js
# Nodejs環境（nodebrewで複数ver管理）
if ! command_exists nodebrew ; then
  echo " ======== Node.js ========"
  curl -L git.io/nodebrew | perl - setup
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew ls-remote
  nodebrew install-binary latest
  nodebrew ls
  nodebrew use latest
  node -v
  npm -v
  echo " ========= END ========="
fi

# Yarn
# パッケージ管理
if ! command_exists yarn ; then
  echo " ======== Yarn ========="
  brew install yarn
  echo " ========= END ========="
fi

#  mariadb
#  RDB(mysqlやPostgreSQLに変更してもよい)
if ! command_exists mysqld ; then
  echo " ======== mariadb ========="
  brew install mariadb
  mysqld --version
  echo " ========= END ========="
fi

# 一般的・汎用的なアプリ
echo " ===== Apps ====="
brew cask install android-file-transfer
brew cask install java
brew cask install android-studio
brew cask install google-chrome
brew cask install iterm2
# brew cask install virtualbox
# brew cask install virtualbox-extension-pack
brew cask install virtualbox --verbose --debug
# brew cask install virtualbox-extension-pack --verbose --debug
brew cask install intellij-idea


# App Storeに公開されているアプリ
echo " ===== App Store apps ====="
brew install mas
mas install 803453959  # Slack (4.2.0)
echo " ========= END ========="
