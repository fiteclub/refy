## refy
Quick reference key shortcuts from command line.

### What does it do?
- Prints .txt files to the console. 
- Any file with extension .txt in the /txt subfolder can be called with ```refy <filename>```

### Usage
Add to your PATH in .bashrc or .zshrc :
```export PATH=$PWD:[ Path to refy ]:$PATH```

So that it looks something like:
```export PATH=$PWD:/Users/username/refy:$PATH```

### To Do
- [ ] Fix colorization with custom token encoder
- [ ] Standardize syntax for keys ⌘,⌥, ⇧, etc
- [ ] Refactor and standardize existing shortcut files
- [ ] Add yaml support
