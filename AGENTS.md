# Project Agent Instructions

## LaTeX workflow

- After modifying LaTeX source, do not compile the document, render generated
  output, or perform output-validation checks by default. The user will compile
  and inspect the document manually.
- Run compilation or generated-output validation only when the user explicitly
  requests it.

## Reference style

- Store bibliography entries in `references.tex` and cite them from the document
  with `\cite{...}`.
- Ensure every citation used in the document appears in the reference section.
- Format journal references as: `author list, paper title, journal name, volume,
  pages or article number (year)`.
- Format each author as `<first initial(s)>. <family name>` and separate authors
  with commas.
- Use the standard abbreviated journal name without italics and set only the
  journal volume in bold.
- Omit the issue and DOI unless the user requests them; do not bold the page or
  article number or year.
- Follow this LaTeX pattern:
  `A. Author, B. Author, Paper title, J. Abbrev., \textbf{12}, 345678 (2026).`
