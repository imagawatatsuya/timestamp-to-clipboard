@echo off
:: バッチファイルのディレクトリを取得
set scriptDir=%~dp0

:: PowerShellスクリプトを実行
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%scriptDir%CopyTimeToClipboard.ps1"

:: 実行結果を表示するために一時停止
:: pause