document.addEventListener("DOMContentLoaded", () => {
  const path = window.location.pathname;
  const depth = path.split("/").length - 2;
  const base = depth > 0 ? "../".repeat(depth) : "";

  const links = [
    { name: "Home", href: `${base}index.html` },
    { name: "Containers", href: `${base}pages/containers.html` },
    { name: "Misc", href: `${base}pages/misc.html` }
  ];

  const current = path.split("/").pop();

  const navLinks = links.map(link => {
    const isActive = link.href.includes(current);
    return `<a href="${link.href}" class="${isActive ? "active" : ""}">${link.name}</a>`;
  }).join(" | ");

  const header = `
    <header>
      <nav class="nav-bar">
        ${navLinks}
      </nav>
    </header>
  `;

  const footer = `
    <footer>
      <p>&copy; 2025 CLI Guide</p>
    </footer>
  `;

  document.getElementById("header").innerHTML = header;
  document.getElementById("footer").innerHTML = footer;
});

