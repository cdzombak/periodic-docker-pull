# periodic-docker-pull

Automatically pull a list of Docker image/tags on a regular basis.

## Configuration

Place a list of Docker images/tags at `~/.config/periodic-docker-pull.txt`. Sample content:

```text
catthehacker/ubuntu:full-latest
catthehacker/ubuntu:act-latest
```

## Installation

### macOS via Homebrew

```shell
brew install cdzombak/oss/periodic-docker-pull
brew services start cdzombak/oss/periodic-docker-pull
```

### macOS Manual Installation

Install the program:

1. Download the pre-built package from [a Github Release](https://github.com/cdzombak/periodic-docker-pull/releases/latest).
2. Extract it and put `_periodic-docker-pull` in a location of your choice.

Or, if you prefer to clone the repo:

1. Clone the Git repository and run its `make build` target.
2. Move `out/_periodic-docker-pull-VERSION-all` to a location of your choice; rename it as desired.

Then, schedule the program:

1. Customize [`com.dzombak.periodic-docker-pull.sample.plist`](https://raw.githubusercontent.com/cdzombak/periodic-docker-pull/blob/main/com.dzombak.periodic-docker-pull.sample.plist) from this repository with the installation path you’ve chosen.
2. Rename it as desired.
3. Move it to `~/Library/LaunchAgents`.

### Linux

I use this program on macOS currently, so I don’t provide .deb packages for installation on Linux. However, the program _should_ work fine on Linux:

1. Install the program, following the same directions as for manual installation on macOS.
2. Schedule it to run for your user as desired via `cron`.

## About

- Issues: https://github.com/cdzombak/periodic-docker-pull/issues/new
- Author: [Chris Dzombak](https://www.dzombak.com)
    - [GitHub: @cdzombak](https://www.github.com/cdzombak)

## License

LGPLv3; see `LICENSE` in this repository.
