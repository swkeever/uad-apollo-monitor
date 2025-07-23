# UAD Apollo Monitor

Automatically close Universal Audio apps when your Apollo interface is disconnected to save battery life on macOS.

## The Problem

UAD Console and UAD Meter & Control Panel consume significant system resources even when your Apollo interface is disconnected:
- UAD Console can use up to 50% GPU on Apple Silicon
- UAD Meter uses ~14% CPU when idle
- Combined, they can drain 5-15% battery per hour

## The Solution

UAD Apollo Monitor checks every 5 minutes if your Apollo interface is connected via Thunderbolt. When disconnected, it automatically closes UAD Console and UAD Meter & Control Panel, while keeping the UA Mixer Engine running for quick reconnection.

## Requirements

- macOS (tested on macOS Sequoia 15.0+)
- Universal Audio Apollo interface (tested with Apollo Twin X)
- UAD software installed

## Installation

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/apollo-monitor.git
cd apollo-monitor
```

2. Run the install script:
```bash
./install.sh
```

That's it! UAD Apollo Monitor will now run automatically in the background.

## Usage

The service runs automatically, but you can also:

### Run manually
```bash
./apollo-monitor.sh
```

### Check service status
```bash
launchctl list | grep apollo
```

### View logs
```bash
tail -f ~/.config/apollo-monitor/apollo-monitor.log
```

### Uninstall
```bash
./uninstall.sh
```

## Configuration

By default, UAD Apollo Monitor checks every 5 minutes. To change this:

1. Edit `com.apollo.monitor.plist`
2. Change the `StartInterval` value (in seconds)
3. Reinstall using `./install.sh`

## How It Works

1. Uses `system_profiler SPThunderboltDataType` to detect Apollo connection
2. When Apollo is disconnected, runs:
   - `killall "UAD Console"`
   - `killall "UAD Meter & Control Panel"`
3. Preserves UA Mixer Engine for quick reconnection
4. Logs all actions to `apollo-monitor.log`

## Battery Impact

- Checking every 5 minutes: ~0.02-0.04% battery per hour
- Savings from closing UAD apps: 5-15% battery per hour
- Net benefit: Significant battery life improvement

## Supported Devices

Currently tested with:
- Apollo Twin X (Thunderbolt 3)

Should work with other Thunderbolt-connected Apollo interfaces. USB Apollo devices would require minor modifications to the detection method.

## Contributing

Pull requests welcome! Please test with your specific Apollo model and report any issues.

## License

MIT

## Author

Created by Sean Keever with assistance from Claude Code