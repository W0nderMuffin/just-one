# just one!

a web app for playing [just one](https://boardgamegeek.com/boardgame/254640/just-one), a cooperative party word game. 

forked from [cjquines](https://github.com/cjquines/just-one).

## implementation details

inspired by [betaveros/castlefall](https://github.com/betaveros/castlefall), the app relies on the players to trust each other. so anyone can kick anyone else, including themselves. joining a room with the same name as an existing player kicks and replaces them, so you can reconnect as yourself if you disconnect.

server uses express and socket.io; frontend uses react.

### build

run `npm install`. development runs on two servers, one for the socket, and one for the client. running `npm start` starts the socket server, and running `npm run hotloader` starts the client server.

you will need a wordlist. the server [Room.js](server/Room.js) assumes you have a wordlist in the same folder named `words.json`. this wordlist should contain one object with the key `words`, and value an array of a list of strings.

## Read words from Google sheets
If you want to use a google sheet as words source then you have to create a google spreadsheet with 1 column with column headername `word`. In each row you can put you word.

Make sure to publish the document to the web. And get the shared id of the google sheet. You'll find it by copying the sharable link of the sheet, e.g. `https://docs.google.com/spreadsheets/d/my-sheet-id/edit?usp=sharing`. In this case the id is `my-sheet-id`.

Set the `sheetid` in the `server/config.json` file and start the server ;)
## Docker
This will create an image with the server and the client in production mode as one container and expose port 4001.

```bash
# Build image
docker build -t myName/just-one .

# Run container e.g.
docker run --rm -d -p 4001:4001 myName/just-one
```

### todo

- sanitize names, clues, and guesses?
- "add clues" feature after a round ends?
- add a timer? or like, a timer that counts up, resetting every phase?
