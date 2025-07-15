# yt-dlp Command Wiki

A comprehensive guide to downloading videos and audio from YouTube and other sites using `yt-dlp`.

---
## What is yt-dlp and Why Use It?
yt-dlp is a powerful command-line tool for downloading videos, audio, and playlists from YouTube and hundreds of other websites. It is a modern fork of the now-inactive youtube-dl, with numerous additional features, bug fixes, and better performance.

Why use yt-dlp?
 - Actively maintained with frequent updates

 - Supports more sites and modern streaming formats

 - More powerful filtering options (e.g., resolution, codec, duration)

 - Improved audio and subtitle support

 - Faster and more reliable than youtube-dl

 - Advanced customization for filenames, metadata, and output


---

## Installation

### Windows

#### Using pip (Python required):

```bash
pip install yt-dlp
```

Update:

```bash
pip install -U yt-dlp
```

#### Standalone Binary (No Python required):

1. Download `yt-dlp.exe` from:
   [https://github.com/yt-dlp/yt-dlp/releases/latest](https://github.com/yt-dlp/yt-dlp/releases/latest)
2. Move it to a folder in your `PATH` (e.g., `C:\Windows`)
3. Run from Command Prompt or PowerShell:

```bash
yt-dlp https://youtube.com/...
```

---

### macOS

#### Using Homebrew:

```bash
brew install yt-dlp
```

Update:

```bash
brew upgrade yt-dlp
```

#### Using pip (Python required):

```bash
pip install yt-dlp
```

---

### Linux

#### Universal (standalone binary for all distros):

```bash
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
```

---

#### Debian / Ubuntu / Linux Mint

```bash
sudo apt update
sudo apt install python3-pip
pip3 install --user yt-dlp
```

---

#### Fedora

```bash
sudo dnf install yt-dlp
```

> If not available in your version, use the pip or binary method above.

---

#### Arch Linux / Manjaro

```bash
sudo pacman -S yt-dlp
```

---

#### Alpine Linux

```bash
apk add yt-dlp
```

> Requires community repository enabled.

---

#### OpenSUSE

```bash
sudo zypper install yt-dlp
```

---

#### Using pip (portable, works on any distro)

```bash
pip install --user yt-dlp
```

Update:

```bash
pip install -U yt-dlp
```

---

## Basic Usage

### Download any video (default quality)

```bash
yt-dlp https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Download best quality available

```bash
yt-dlp -f best https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Download specific quality (1080p max)

```bash
yt-dlp -f "best[height<=1080]" https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Download 720p max

```bash
yt-dlp -f "best[height<=720]" https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

---

## Audio Only Downloads

>Note: the following commands will only work if the current directory is the home directory for linux. Use `pwd` command to check if you are in the home directory. If not in home directory, use `cd` command to change to home directory.

### Download as MP3

```bash
yt-dlp -x --audio-format mp3 https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Download as MP3 with best quality

```bash
yt-dlp -x --audio-format mp3 --audio-quality 0 https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Download as WAV (lossless)

```bash
yt-dlp -x --audio-format wav https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Download as M4A (good for Apple devices)

```bash
yt-dlp -x --audio-format m4a https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

---

## File Naming

### Clean filename (no video ID)

```bash
yt-dlp -o "%(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Include uploader name

```bash
yt-dlp -o "%(uploader)s - %(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Include upload date

```bash
yt-dlp -o "%(upload_date)s - %(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Organize by uploader folder

```bash
yt-dlp -o "%(uploader)s/%(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

---

## Playlist Downloads

### Download entire playlist

```bash
yt-dlp https://www.youtube.com/playlist?list=...
```

### Download playlist as MP3s

```bash
yt-dlp -x --audio-format mp3 https://www.youtube.com/playlist?list=...
```

### Download only one video from playlist URL

```bash
yt-dlp --no-playlist https://www.youtube.com/watch?v=...&list=...
```

### Download specific range from playlist (videos 1–5)

```bash
yt-dlp --playlist-start 1 --playlist-end 5 https://www.youtube.com/playlist?list=...
```

### Download only new videos (skip already downloaded)

```bash
yt-dlp --download-archive downloaded.txt https://www.youtube.com/playlist?list=...
```

---

## Metadata and Thumbnails

### Add metadata to audio files

```bash
yt-dlp -x --audio-format mp3 --add-metadata https://www.youtube.com/watch?v=...
```

### Embed thumbnail as album art

```bash
yt-dlp -x --audio-format mp3 --embed-thumbnail https://www.youtube.com/watch?v=...
```

### Download thumbnail separately

```bash
yt-dlp --write-thumbnail https://www.youtube.com/watch?v=...
```

### All metadata options combined

```bash
yt-dlp -x --audio-format mp3 --add-metadata --embed-thumbnail --write-thumbnail https://www.youtube.com/watch?v=...
```

---

## Subtitles

### Download video with subtitles

```bash
yt-dlp --write-subs https://www.youtube.com/watch?v=...
```

### Download auto-generated subtitles

```bash
yt-dlp --write-auto-subs https://www.youtube.com/watch?v=...
```

### Download specific language subtitles

```bash
yt-dlp --write-subs --sub-langs en https://www.youtube.com/watch?v=...
```

### Embed subtitles in video

```bash
yt-dlp --embed-subs https://www.youtube.com/watch?v=...
```

---

## Error Handling

### Ignore errors and continue

```bash
yt-dlp -i https://www.youtube.com/playlist?list=...
```

### Retry failed downloads

```bash
yt-dlp --retries 3 https://www.youtube.com/watch?v=...
```

### Skip unavailable videos

```bash
yt-dlp --ignore-errors https://www.youtube.com/playlist?list=...
```

---

## Advanced Options

### Limit download speed (1MB/s)

```bash
yt-dlp --limit-rate 1M https://www.youtube.com/watch?v=...
```

### Download only videos shorter than 10 minutes

```bash
yt-dlp --match-filter "duration < 600" https://www.youtube.com/playlist?list=...
```

### Download only videos uploaded after specific date

```bash
yt-dlp --dateafter 20240101 https://www.youtube.com/playlist?list=...
```

### Use proxy

```bash
yt-dlp --proxy http://proxy.example.com:8080 https://www.youtube.com/watch?v=...
```

---

## Bash Tips and Tricks

### Handle URLs with special characters

```bash
yt-dlp "https://www.youtube.com/watch?v=...&t=30s"
```

### Escape special characters in filenames

```bash
yt-dlp -o '%(title)s.%(ext)s' https://www.youtube.com/watch?v=...
```

### Download multiple URLs at once

```bash
yt-dlp https://www.youtube.com/watch?v=... https://www.youtube.com/watch?v=...
```

### Use a file with URLs

```bash
yt-dlp -a urls.txt
```

### Background downloads

```bash
nohup yt-dlp https://www.youtube.com/playlist?list=... > download.log 2>&1 &
```

### Check if command succeeded

```bash
if yt-dlp https://www.youtube.com/watch?v=...; then
    echo "Download successful"
else
    echo "Download failed"
fi
```

---

## Common Issues and Solutions

### "ERROR: unable to download video data"

```bash
pip install -U yt-dlp
```

### Age-restricted videos

```bash
yt-dlp --cookies-from-browser chrome https://www.youtube.com/watch?v=...
```

### Geo-blocked videos

```bash
yt-dlp --proxy socks5://127.0.0.1:1080 https://www.youtube.com/watch?v=...
```

### Very long filenames

```bash
yt-dlp --trim-filenames 100 https://www.youtube.com/watch?v=...
```

---

## Useful Combinations

### Perfect MP3 download with metadata

```bash
yt-dlp -x --audio-format mp3 --audio-quality 0 --add-metadata --embed-thumbnail -o "%(title)s.%(ext)s" https://www.youtube.com/watch?v=...
```

### Archive entire channel

```bash
yt-dlp -f "best[height<=1080]" --download-archive archive.txt -o "%(uploader)s/%(upload_date)s - %(title)s.%(ext)s" https://www.youtube.com/@channelname
```

### Download with subtitles and metadata

```bash
yt-dlp --write-subs --embed-subs --add-metadata --embed-thumbnail -o "%(title)s.%(ext)s" https://www.youtube.com/watch?v=...
```

---

## Quick Reference

| Command                       | Description                      |
| ----------------------------- | -------------------------------- |
| `-f best`                     | Download best quality            |
| `-f "best[height<=720]"`      | Download max 720p                |
| `-x --audio-format mp3`       | Extract audio as MP3             |
| `-o "%(title)s.%(ext)s"`      | Clean filename                   |
| `--add-metadata`              | Add title, artist info           |
| `--embed-thumbnail`           | Add album art                    |
| `--write-subs`                | Download subtitles               |
| `--no-playlist`               | Download single video only       |
| `-i`                          | Ignore errors                    |
| `--download-archive file.txt` | Skip previously downloaded items |




