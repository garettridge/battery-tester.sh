# battery-tester.sh
Test how long old laptop batteries last. In off-brand batteries the internal controllers cannot be trusted to report percentages correctly, resulting in abrupt laptop shutoffs when you are not near 0%.  Unlike original batteries, these do not calibrate themselves to the correct 0% and 100% after a simple drain and charge.

This program manually gives you the amount of time a battery lasts, and percentage that it died at, so you can write it on a sticker on the battery.  Now you have a basis to compare used batteries and keep the best one.

## Installation

Just set battery-tester.sh to executable and run it.

Or, example:

```bash
if ! [ -d "$HOME/.local/bin" ]
  mkdir -p ~/.local/bin
  PATH="$HOME/.local/bin:$PATH"
fi

chmod +x battery-tester.sh
mv battery-tester.sh ~/.local/bin/battery-tester.sh
```
## Usage

Run battery-tester.sh:

```bash
battery-tester.sh
```
Now run some predictably demanding program, such as playing a video on loop with MPV.  Unplug the battery and wait for it to sleep / die.

To see results, open all files under $HOME/battery_test. Example:

```bash
view -p ~/battery_test/*
```
### Example output:

```
start_time=1790914540 2026-10-02T00:15:40-04:00
Time: 1790914540 0 Claimed capacity: 100 Volts: 12517000
Time: 1790914545 5 Claimed capacity: 100 Volts: 12517000
Time: 1790914550 10 Claimed capacity: 99 Volts: 11528000
Time: 1790914555 15 Claimed capacity: 99 Volts: 11509000
Time: 1790914560 20 Claimed capacity: 98 Volts: 11610000
Time: 1790914565 25 Claimed capacity: 98 Volts: 11142000
Time: 1790914570 30 Claimed capacity: 98 Volts: 11361000
Time: 1790914575 35 Claimed capacity: 97 Volts: 11133000
Time: 1790914580 40 Claimed capacity: 97 Volts: 10926000
Time: 1790914585 45 Claimed capacity: 97 Volts: 10959000
Time: 1790914590 50 Claimed capacity: 96 Volts: 10699000
Time: 1790914595 55 Claimed capacity: 96 Volts: 10130000
Fell under low voltage at: 1790914595
```

In this example, the battery lasted for less than a minute (55 seconds) before hitting a pre-defined low voltage.  Units are always in seconds so be prepared to divide by 60.  The battery voltage fell too low while it was still reporting itself as 96% full.

Here, the threshold used was 10.5v (10500000) but that can be configured as needed in the program (via a constant) to avoid hard shutoffs during testing.

