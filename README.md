# Timestamp to Clipboard

現在時刻を "yyyy/MM/dd(ddd) HH:mm:ss" (例: 2024/05/07(火) 14:30:00) の形式でクリップボードにコピーするスクリプト。Windows 環境 (PowerShell) 用。

## 概要

このスクリプトは、Windows のバッチファイル (`.bat`) と PowerShell スクリプト (`.ps1`) を組み合わせて、特定のフォーマットで現在時刻をクリップボードにコピーします。

## 使い方

1.  **ファイル配置:**
    *   `CopyTimeToClipboard.ps1`
    *   `RunCopyTimeToClipboard.bat`

    上記2つのファイルを同じディレクトリに配置します。

2.  **実行:**
    `RunCopyTimeToClipboard.bat` をダブルクリックして実行します。

    実行すると、PowerShell スクリプトが呼び出され、現在時刻がクリップボードにコピーされます。コンソールウィンドウはすぐに閉じます (結果表示のための `pause` はコメントアウトされています)。

    クリップボードの内容を任意の場所に貼り付け (Ctrl+V など) して確認できます。

## スクリプトの解説

*   **`RunCopyTimeToClipboard.bat` (バッチファイル):**
    *   `@echo off`: コマンドの表示をオフにします。
    *   `set scriptDir=%~dp0`:  バッチファイル自身のディレクトリパスを取得します。
    *   `powershell.exe ...`: PowerShell を実行します。
        *   `-NoProfile`:  PowerShell プロファイルを読み込まずに実行します。
        *   `-ExecutionPolicy Bypass`:  実行ポリシーを一時的にバイパスし、スクリプトの実行を許可します。(セキュリティには注意)
        *   `-File "%scriptDir%CopyTimeToClipboard.ps1"`:  `CopyTimeToClipboard.ps1` スクリプトを実行します。
    *   `:: pause` (コメントアウト):  実行後にコンソールを一時停止するコマンド (コメントアウトされているので、ウィンドウはすぐ閉じます)。

*   **`CopyTimeToClipboard.ps1` (PowerShell スクリプト):**
    *   `$culture = New-Object System.Globalization.CultureInfo("ja-JP")`: 日本語のカルチャ情報を作成。
    *   `$currentTime = Get-Date`: 現在の日時を取得。
    *   `$formattedTime = $currentTime.ToString("yyyy/MM/dd(ddd) HH:mm:ss", $culture)`: 日時を指定された書式 (年/月/日(曜日) 時:分:秒) にフォーマット。
    *   `Set-Clipboard -Value $formattedTime`: フォーマットされた日時をクリップボードにコピー。
    *   `try...catch`:  エラーハンドリング。
        *   `try` ブロック内でクリップボードへのコピーを試行。
        *   `catch` ブロックでエラーが発生した場合の処理を記述 (エラーメッセージを表示)。

## 注意点

*   **実行ポリシー:**  PowerShell の実行ポリシーによっては、スクリプトが実行できない場合があります。`RunCopyTimeToClipboard.bat` では `-ExecutionPolicy Bypass` を使用して一時的にバイパスしていますが、セキュリティ上のリスクを理解した上で使用してください。  恒久的に実行ポリシーを変更する場合は、管理者権限で PowerShell を起動し、`Set-ExecutionPolicy` コマンドを使用します (例: `Set-ExecutionPolicy RemoteSigned`)。ただし、セキュリティポリシーに従って慎重に設定してください。
* **文字コード:** PowerShell スクリプト (`.ps1`) は、UTF-8 (BOMなし) で保存することを推奨します。文字コードが異なると、日本語の曜日などが正しく表示されないことがあります。

## ライセンス

MIT License
