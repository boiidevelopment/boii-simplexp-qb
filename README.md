# BOII | Development - Simple skills export script 

Here we have a simple XP script to allow adding or removing xp via exports from any script using QBCore metadata.
Includes commands to check a players current xp and edit a players xp.

### USAGE ###

- /checkxp to check a players xp
- /editxp to edit a players xp you can add or remove
- use the export provided within any client script to add or remove xp
- use event provided within any server script to add or remove xp

### INSTALL ### 

1) Rename the folder to `boii-simplexp` and drag into your server resources
2) Add `ensure boii-simplexp` into your server.cfg if you are using this method of ensuring
3) Follow the instructions provided under **ACE PERMISSIONS** in order to have access to the edit xp command
3) Restart server or type `refresh; ensure boii-simplexp` into your F8

### ACE PERMISSIONS ###
```
- In order to be able to use the edit xp command you need to have the correct permissions
- Copy the following into your `server.cfg` file
- Replace "YOUR IDENTIFIER" with your identifier
- You can use any identifer just remember to edit `.fivem` accordingly

add_ace qbcore.god boii.simplexp allow
add_principal identifier.fivem:"YOUR IDENTIFIER" qbcore.god
```

### HOW TO USE ###

Commands
```
- Check xp command 
/checkxp "PLAYERS ID" "METADATA NAME"

- Edit xp command
/editxp "PLAYERS ID" "CHOICE: 1 = ADD, 2 = REMOVE" "METADATA NAME" "AMOUNT"
```

Client
```
- Export to add/remove xp from client side scripts; 
- "1 = ADD, 2 = REMOVE" "METADATA NAME" "AMOUNT"

exports['boii-simplexp']XP(args, metadata, amount)

- Add xp example
exports['boii-simplexp']XP(1, 'drugxp', 10)

- Remove xp example
exports['boii-simplexp']XP(2, 'drugxp', 10)
```

Server
```
- Event to trigger from server side scripts to add/remove xp 
- "SOURCE" "1 = ADD, 2 = REMOVE" "METADATA NAME" "AMOUNT"

TriggerClientEvent('boii-simplexp:cl:XP', source,  1, 'drugxp', 100)
```
### PREVIEW ###
[YouTube](https://www.youtube.com/shorts/bugtOF0iOsY)

### SUPPORT ###
[Discord](https://discord.gg/MUckUyS5Kq)
