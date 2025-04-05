# dp-evidencebag

[Evidence Bag](https://forum-cfx-re.akamaized.net/optimized/5X/0/8/e/f/08ef0b73bc2e63568f9f426abd3bb926b52e1fb9_2_690x239.png)

## Description
Advanced Evidence Bag System for ox_inventory. This resource adds functional evidence bags that can be used to collect and preserve evidence at crime scenes.

## Features
- Unique identifier for each evidence bag
- Customizable storage capacity and weight
- Multi-language support (English, Czech)
- Integration with ox_inventory
- Animated interaction when opening evidence bags

## Dependencies
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_lib](https://github.com/overextended/ox_lib)

## Installation

### 1. Install the resource
- Download the resource
- Place it in your server's resources folder
- Add `ensure dp-evidencebag` to your server.cfg

### 2. Add the item to your ox_inventory/data/items.lua file
```lua
['evidencebag'] = {
    label = 'Evidence Bag',
    weight = 100,
    stack = false,
    close = true,
    description = 'Used to collect and preserve evidence at crime scenes',
    image = 'paperbag.png',
    useable = true,
    client = {
        export = 'dp-evidencebag.openEvidenceBag'
    }
},
```

### 3. Ensure the image exists
Make sure you have `paperbag.png` in your ox_inventory/web/images folder.

## Configuration
You can modify the settings in the `config.lua` file:

- `Config.EvidenceBagItem`: The item name used for the evidence bag
- `Config.EvidenceBagStorage.slots`: Number of inventory slots in each evidence bag
- `Config.EvidenceBagStorage.weight`: Maximum weight capacity in grams
- `Config.Language`: Set language ('en' or 'cs')
- `Config.DebugMode`: Enable/disable debug mode

## Usage
1. Add the evidence bag item to your inventory through your server's item system
2. Use the evidence bag from your inventory
3. Store evidence items in the bag
4. Each bag receives a unique identifier for tracking purposes

## Languages
Currently supported languages:
- English (en)
- Czech (cs)

You can add more languages by expanding the `Config.Locales` table in `config.lua`.

## Community & Support
Join our Discord server for support, updates, and discussions:
[https://discord.gg/Xkq5drGVca](https://discord.gg/Xkq5drGVca)

## Credits
- Author: Dzejkop
- Version: 1.0.0

## License
This project is licensed under the MIT License - see the LICENSE file for details.
