# cli-wiki

A CLI-based personal wiki built with [mdBook](https://rust-lang.github.io/mdBook/) to document and share tools, commands, and concepts related to development, server administration, security, and more.

## About

I’m a student passionate about learning. I want to learn more about Linux CLI tools and I am documenting what I have learnt here. This project is my attempt to create a structured knowledge base while learning. Contributions are welcome, let’s build and learn together!

## Status: Work in Progress

This wiki is in **early development** and evolving constantly. Many sections are still incomplete or rough drafts. Expect updates, changes, and occasional reorganization as I build it out.

Your feedback and contributions can really help shape it.

## Wiki Format & Philosophy

This wiki is designed to be:

- **Simple**: Focused, clear explanations without unnecessary jargon.
- **Straightforward**: Minimal fluff — just what you need to understand and apply.
- **Scenario-Based**: Includes practical examples to show real-world usage.
- **Beginner-Friendly**: Easy to follow, even if you're just starting out.

Each section aims to answer:
> *What is this? Why use it? How do I use it effectively?*

Examples are included where needed to clarify usage and help users quickly grasp concepts.

If you contribute, please follow this style so the wiki stays clean and approachable for everyone.

## View the Wiki

You can explore the wiki online here: [https://cli-wiki.keil.website/](https://cli-wiki.keil.website/)

## How to Build the Wiki with mdBook

The `.md` files live inside `cli-wiki/src` and are compiled into a static site using [mdBook](https://rust-lang.github.io/mdBook/).

### Install `mdBook`

If you have [Rust](https://www.rust-lang.org/tools/install) installed:

```bash
cargo install mdbook
```

Or install via package manager:

- **Arch Linux**: `sudo pacman -S mdbook`
- **macOS (Homebrew)**: `brew install mdbook`
- **Nix**: `nix-env -iA nixpkgs.mdbook`

### Build and Serve Locally

Run this from the project root (`cli-wiki`):

```bash
mdbook serve
```

This starts a local development server and watches for changes:

```
Serving on http://localhost:3000
```

### File Structure

```
cli-wiki/
├── src/
│   ├── introduction.md
│   ├── git-gh/
│   ├── server-tools/
│   ├── ...
│   └── SUMMARY.md
├── book.toml
└── README.md
```

- `src/SUMMARY.md` defines the wiki structure.
- `book.toml` contains the mdBook configuration.
- Output is generated in the `book/` directory after build.

### Publish to GitHub Pages

To publish your wiki to GitHub Pages:

1. Build it:
   ```bash
   mdbook build
   ```

2. Deploy the `book/` directory.

## Source Code

Check out the source or contribute on GitHub: [https://github.com/keilaash/cli-wiki](https://github.com/keilaash/cli-wiki)

## Contributing

Contributions are encouraged! If you have commands, tips, or workflows to share, feel free to submit a pull request or open an issue. All contributions big or small help improve this project for everyone.

## License

This project is open source and available under the [MIT License](LICENSE).
