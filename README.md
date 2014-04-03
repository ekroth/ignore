ignore
======

download gitignore from github

Help
----
```
Usage: ignore [OPTION]... [LANG]...
Output gitignore for a LANG(s) from Github.

  -v,			 verbose, output extra information
  -s,			 silent, only output gitignore(s)
  -h,			 this help

Examples:
  ignore Haskell		         Output Haskell gitignore
  ignore -v Haskell Global/Emacs Output Haskell and Emacs gitignore with verbose
  ignore -s Scala		         Scala gitignore without any extra information
```

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
