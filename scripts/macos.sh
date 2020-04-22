#!/bin/bash

# ========================== Global ==========================
# キーリピートの速度
defaults write NSGlobalDomain KeyRepeat -int 2
# キーリピート開始までのタイミング
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# 1本指で強めのクリックで調べる&データ検出
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true
# カーソルの移動速度を変更 (1〜15)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 15
# トラックパッドのスクロールの速さ
defaults write NSGlobalDomain com.apple.trackpad.scrolling -float 0.4412
# スクロール方向をナチュラルに
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# スクリーンショットの保存先変更
mkdir ~/Pictures/ScreenShot
defaults write com.apple.screencapture location ~/Pictures/ScreenShot
# ファイル名の文字列部分を「ScreenShot」に変更
defaults write com.apple.screencapture name ScreenShot

# ====================== Mission Control =====================
# Bottom right screen corner → Show application windows （右下 → ディスプレイをスリープ）
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

# ========================== Menubar =========================
# バッテリー残量を％表記に
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# 日付と時刻のフォーマット（24時間表示、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE) H:mm"
# 再起動して設定反映
killall SystemUIServer

# =========================== Dock ===========================
# 表示位置を左側に変更
defaults write com.apple.dock orientation -string "left"
# Dockが表示されるまでの待ち時間を無効にする
defaults write com.apple.dock autohide-delay -float 0
# 自動的に非表示
defaults write com.apple.dock autohide -bool true
# Dockに標準で入っている全てのアプリを消す
defaults write com.apple.dock persistent-apps -array
# 最近使ったアプリを表示しない
defaults write com.apple.dock show-recents -bool false
# 再起動して設定反映
killall Dock

# ========================== Finder ==========================
# ディレクトリのスプリングロードを有効化
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
# 全ての拡張子のファイルを表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# デフォルトはカラムビュー表示
defaults write com.apple.finder FXPreferredViewStyle clmv
# Quick Look上でテキストの選択を可能に
defaults write com.apple.finder QLEnableTextSelection -bool true
# USBやネットワークストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# 再起動して設定反映
killall Finder
