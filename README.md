ignore
======

download gitignore from github

Examples
--------
Download a gitignore. 

```
ignore Scala
```

By default the gitignore will be outputted din the following format:
```
### Gitignore: $ARG ###
## File: $URL ##
<gitignore>
### End: $ARG ###"
```

Download multiple gitignores.
```
ignore Haskell Global/Emacs
```

Run in silent mode, this will output the gitignore without any additional comments.
``` 
ignore -s Java
```

When creating a new repository, Haskell and TeX.
```
ignore Haskell TeX > .gitignore
```

TODO
----

List all available gitignores.
