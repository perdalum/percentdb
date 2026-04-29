# PercentDB

**PercentDB** is a minimal, human-readable text format for storing dated notes or records. It is designed to be simple to write, easy to parse, and efficient to process.

---

## Overview

A PercentDB file consists of a sequence of entries. Each entry:

- Starts with a header line beginning with `%%`
- Contains a date in ISO format (`YYYY-MM-DD`)
- Is followed by free-form text

The format is intentionally minimal: no escaping, no nested structure, no metadata beyond the date.

---

## Example

```text
%% 2026-04-29
This is the first entry.
It can span multiple lines.

%% 2026-04-30
Another entry.
```

---

## Syntax

### Entry Header

Each entry begins with:

```
%% YYYY-MM-DD
```

- `%%` — record delimiter
- One or more spaces
- `YYYY-MM-DD` — date (ISO 8601 format)

### Entry Content

- Starts on the line immediately after the header
- Continues until:
  - the next `%%` header, or
  - end-of-file
- May contain arbitrary text, including newlines

---

## Rules

- Entries are **strictly separated** by lines starting with `%%`
- Dates must match:

  ```
  [0-9]{4}-[0-9]{2}-[0-9]{2}
  ```

- Content is treated as plain text
- Leading and trailing whitespace in content may be trimmed by parsers
- No escaping or quoting rules are defined

---

## Informal Grammar

```
file    ::= record*
record  ::= "%%" space+ date newline text
date    ::= YYYY "-" MM "-" DD
text    ::= any characters until next "%%" or EOF
```

---

## Design Goals

- **Human-friendly** — easy to read and edit in any text editor
- **Minimal** — no unnecessary syntax or structure
- **Streamable** — can be parsed in a single pass
- **Robust** — tolerant of arbitrary content

---

## Typical Use Cases

- Journaling
- Research notes
- Log files with human-readable entries
- Lightweight data capture

---

## Wolfram Language Integration

This repository includes an `Import` extension for Wolfram Language:

```wl
Import["file.pdb", "PercentDB"]
```

Available elements:

- `"Data"` → list of associations:
  ```wl
  <|"date" -> DateObject[…], "text" -> "..."|>
  ```
- `"Dataset"` → `Dataset`
- `"Tabular"` → `Tabular` (or `Dataset` fallback)

Default import returns `"Tabular"`.

---

## File Extension

There is no strict requirement, but typical choices:

- `.pdb`
- `.percentdb`
- `.txt`

---

## Philosophy

PercentDB is deliberately *not* a database.

It’s a structured text convention that:
- keeps friction near zero
- avoids tooling lock-in
- remains inspectable and editable at all times

---

## License

MIT License
