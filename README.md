# ![Executor](https://raw.githubusercontent.com/jorgefuertes/executor/main/assets/executor.svg)

## Homebrew Formula for Executor

Official Homebrew tap for [Executor](https://github.com/jorgefuertes/executor) - Execute commands in a fancy way.

## What is Executor?

Executor is a command-line tool that provides an enhanced way to run and manage shell commands with advanced features and a clean interface. It hides log pollution and provides visual feedback, timing, and clear error output.

**Features:**

- Enhanced command execution with colorized output and spinners
- Command existence checking (`which`)
- Log shadowing - output displayed only on error or when requested
- Port availability checking (`port`)
- Web response validation (`web`)
- Automatic non-interactive mode detection
- Custom execution environment variables

## Installation

**Recommended method** - Install directly without tapping:

~~~bash
brew install jorgefuertes/executor/executor
~~~

Or tap the repository first, then install:

~~~bash
brew tap jorgefuertes/executor
brew install executor
~~~

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

~~~ruby
tap "jorgefuertes/executor"
brew "executor"
~~~

## Usage

After installation, run:

~~~bash
executor --help
~~~

## Documentation

- [Executor Documentation](https://github.com/jorgefuertes/executor) - Main project repository
- [Homebrew Documentation](https://docs.brew.sh) - Homebrew usage and commands
- [Latest Releases](https://github.com/jorgefuertes/executor/releases) - Download and changelog

## About This Tap

This is the official Homebrew tap for Executor. It provides pre-built bottles for macOS (arm64 and x86_64) to ensure fast installation without compilation.

**Supported platforms:**

- macOS Sequoia (15) - Apple Silicon & Intel
- macOS Sonoma (14) - Apple Silicon & Intel  
- macOS Ventura (13) - Apple Silicon & Intel

## License

Executor is licensed under GPL-3.0-or-later. See the [LICENSE](https://github.com/jorgefuertes/executor/blob/main/LICENSE) file for details.
