# Desktop be clean!
## Unclutter your desktop with a single command
Desktop be clean moves all files and directories found on your desktop to a folder named `Desktop-Y-m-d` in your home directory. If the folder already exists, the files and directories will be moved to the existing folder.
### Installation
```bash
$ git clone
$ cd desktop-be-clean
```

### Usage
```bash
$ bash desktop-be-clean.sh
```

#### Options
- `-s` or `--step`: Manually step through each file and directory to confirm if it should be moved. 