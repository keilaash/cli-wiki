# yt-dlp: Download Media from YouTube and More

`yt-dlp` is a powerful command-line tool for downloading videos and extracting audio from YouTube and many other sites.

---

## 🎞️ Download 1080p MP4 Video

```bash
yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
-o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=VIDEO_ID"
```

- Downloads the best video/audio up to 1080p  
- Merges them into one `.mp4` file  
- Outputs file as `Video Title.mp4`

---

## 🎵 Download MP3 Audio Only

```bash
yt-dlp -x --audio-format mp3 \
-o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=VIDEO_ID"
```

- `-x`: Extracts audio  
- `--audio-format mp3`: Converts to MP3  
- Output will be `Video Title.mp3`

---

## 🛠️ Useful Add-ons

- `--embed-thumbnail` — Embed thumbnail as album art  
- `--add-metadata` — Add ID3 tags (title, artist, etc.)  
- `--no-playlist` — Prevent downloading an entire playlist  
- `-i` — Ignore errors (useful in batch jobs)

---

## 📥 Example: Batch Download Playlist as MP3s

```bash
yt-dlp -i -x --audio-format mp3 --embed-thumbnail \
--add-metadata "https://www.youtube.com/playlist?list=YOUR_PLAYLIST_ID"
```

---

## 📦 Install yt-dlp

```bash
pip install -U yt-dlp
```

---

## 🧠 Why yt-dlp?

- Actively maintained (a fork of `youtube-dl`)  
- Supports more sites and formats  
- Faster, more flexible

