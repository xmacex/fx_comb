# Comb filter fx for norns

The SuperCollider [CombC](https://doc.sccode.org/Classes/CombC.html) comb filter as a norns effect. Requires sixolet's amazing [fx mod](https://llllllll.co/t/fx-mod/62726) framework.

Regarding negative decaytime

> Time for the echoes to decay by 60 decibels. If this time is negative then the feedback coefficient will be negative, thus emphasizing only odd harmonics at an octave lower.

A chained second, delayed comb filter is available for extra atonal phase destruction.

# Requirements

- norns
- [fx mod](https://llllllll.co/t/fx-mod/62726)

# Installation

After installing the fx mod and enabling it, install the comb filter via [Maiden](https://norns.local) with

```
;install https://github.com/xmacex/fx_comb
```

Then, enable via the `SYSTEM > MODS` menu, and restart norns.

# Usage

You'll find the exposed parameters in norns menu in the section `fx comb`. Like with all norns parameters, use <kbd>K3</kbd>-<kbd>E3</kbd> for finer control.

See the [fx mod](https://llllllll.co/t/fx-mod/62726) documentation about routing to sends, end-of-chain etc.
