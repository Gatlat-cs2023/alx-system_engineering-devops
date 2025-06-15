# 0x03. Shell, init files, variables and expansions

## Description

This project is part of the **ALX Software Engineering Program**. It introduces advanced shell concepts including initialization files, variables, expansions, and command aliasing. You’ll learn how to manage the shell environment and automate shell behavior using scripts and configuration files.

---

## Learning Objectives

By the end of this project, you should be able to:

- Understand the role of shell initialization files
- Define and use shell variables (local and global)
- Create and use shell aliases
- Use parameter expansions and command substitutions
- Understand variable scopes in bash
- Perform arithmetic operations in the shell

---

## Tasks

| File | Description |
|------|-------------|
| `0-alias` | Creates an alias `ls` with the value `rm *` (⚠️ use with caution) |
| _...more files will be added here as tasks progress..._ |

---

## Usage

To use the alias from `0-alias`:

```bash
source ./0-alias
ls  # This will delete all files in the current directory
```

To avoid the alias and use the real ls:
```bash
\ls
```