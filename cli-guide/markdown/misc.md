# yt-dlp Command Wiki

A comprehensive guide to downloading videos and audio from YouTube and other sites using yt-dlp.

## Installation

    pip install yt-dlp

Update to latest version:

    pip install -U yt-dlp

## Basic Usage

### Download any video (default quality)

    yt-dlp https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download best quality available

    yt-dlp -f best https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download specific quality (1080p max)

    yt-dlp -f "best[height<=1080]" https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download 720p max

    yt-dlp -f "best[height<=720]" https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Audio Only Downloads

### Download as MP3

    yt-dlp -x --audio-format mp3 https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download as MP3 with best quality

    yt-dlp -x --audio-format mp3 --audio-quality 0 https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download as WAV (lossless)

    yt-dlp -x --audio-format wav https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download as M4A (good for Apple devices)

    yt-dlp -x --audio-format m4a https://www.youtube.com/watch?v=dQw4w9WgXcQ

## File Naming

### Clean filename (no video ID)

    yt-dlp -o "%(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Include uploader name

    yt-dlp -o "%(uploader)s - %(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Include upload date

    yt-dlp -o "%(upload_date)s - %(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Organize by uploader folder

    yt-dlp -o "%(uploader)s/%(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Playlist Downloads

### Download entire playlist

    yt-dlp https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Download playlist as MP3s

    yt-dlp -x --audio-format mp3 https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Download only one video from playlist URL

    yt-dlp --no-playlist https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Download specific range from playlist (videos 1-5)

    yt-dlp --playlist-start 1 --playlist-end 5 https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Download only new videos (skip already downloaded)

    yt-dlp --download-archive downloaded.txt https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

## Metadata and Thumbnails

### Add metadata to audio files

    yt-dlp -x --audio-format mp3 --add-metadata https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Embed thumbnail as album art

    yt-dlp -x --audio-format mp3 --embed-thumbnail https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download thumbnail separately

    yt-dlp --write-thumbnail https://www.youtube.com/watch?v=dQw4w9WgXcQ

### All metadata options combined

    yt-dlp -x --audio-format mp3 --add-metadata --embed-thumbnail --write-thumbnail https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Subtitles

### Download video with subtitles

    yt-dlp --write-subs https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download auto-generated subtitles

    yt-dlp --write-auto-subs https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download specific language subtitles

    yt-dlp --write-subs --sub-langs en https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Embed subtitles in video

    yt-dlp --embed-subs https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Error Handling

### Ignore errors and continue

    yt-dlp -i https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Retry failed downloads

    yt-dlp --retries 3 https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Skip unavailable videos

    yt-dlp --ignore-errors https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

## Advanced Options

### Limit download speed (1MB/s)

    yt-dlp --limit-rate 1M https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download only videos shorter than 10 minutes

    yt-dlp --match-filter "duration < 600" https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Download only videos uploaded after specific date

    yt-dlp --dateafter 20240101 https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va

### Use proxy

    yt-dlp --proxy http://proxy.example.com:8080 https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Bash Tips and Tricks

### Handle URLs with special characters

Always wrap URLs in quotes to avoid bash interpretation:

    yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=30s"

### Escape special characters in filenames

Use single quotes to prevent bash from interpreting special characters:

    yt-dlp -o '%(title)s.%(ext)s' https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Download multiple URLs at once

    yt-dlp https://www.youtube.com/watch?v=dQw4w9WgXcQ https://www.youtube.com/watch?v=another_video

### Use a file with URLs

Create a file called `urls.txt` with one URL per line, then:

    yt-dlp -a urls.txt

### Background downloads

Run in background and save output to log:

    nohup yt-dlp https://www.youtube.com/playlist?list=PLrAXtmRdnEQy6nuLMfqVg_7Bfs6qQD-Va > download.log 2>&1 &

### Check if command succeeded

    if yt-dlp https://www.youtube.com/watch?v=dQw4w9WgXcQ; then
        echo "Download successful"
    else
        echo "Download failed"
    fi

## Common Issues and Solutions

### "ERROR: unable to download video data"
Try updating yt-dlp first:

    pip install -U yt-dlp

### Age-restricted videos
Use cookies from your browser:

    yt-dlp --cookies-from-browser chrome https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Geo-blocked videos
Use a VPN or proxy:

    yt-dlp --proxy socks5://127.0.0.1:1080 https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Very long filenames
Limit filename length:

    yt-dlp --trim-filenames 100 https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Useful Combinations

### Perfect MP3 download with metadata

    yt-dlp -x --audio-format mp3 --audio-quality 0 --add-metadata --embed-thumbnail -o "%(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Archive entire channel

    yt-dlp -f "best[height<=1080]" --download-archive archive.txt -o "%(uploader)s/%(upload_date)s - %(title)s.%(ext)s" https://www.youtube.com/@channelname

### Download with subtitles and metadata

    yt-dlp --write-subs --embed-subs --add-metadata --embed-thumbnail -o "%(title)s.%(ext)s" https://www.youtube.com/watch?v=dQw4w9WgXcQ

## Quick Reference

| Command | Description |
|---------|-------------|
| `-f best` | Download best quality |
| `-f "best[height<=720]"` | Download max 720p |
| `-x --audio-format mp3` | Extract audio as MP3 |
| `-o "%(title)s.%(ext)s"` | Clean filename |
| `--add-metadata` | Add title, artist info |
| `--embed-thumbnail` | Add album art |
| `--write-subs` | Download subtitles |
| `--no-playlist` | Single video only |
| `-i` | Ignore errors |
| `--download-archive file.txt` | Track downloaded videos |
