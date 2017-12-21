# TAMUCAL: Smart semester week number (and perhaps curriculum) exporter for Texas A&M University

**Download**: Navigate to the [release](https://github.com/alick/tamucal/releases) tab.

## Screenshot

![](screenshot/ui.png?raw=true)

## Main Features

* Fully automated operation: only one click is needed
    * Needs no "first day of semester" input
    * Automatically saves exported calendar (through HTML5 Blob)
* Standard iCalendar format for import into popular calendar apps
* All processing done locally for the sake of privacy

TODO: Curriculum export

## Build

TAMUCAL is built using [GRUNT](http://gruntjs.com).

```
npm install --global grunt-cli
npm install
grunt release
```

Use `dist/tamucal.user.js`

## License

MIT

## Acknowledgment

TAMUCAL is based on [THUCAL2](https://github.com/summivox/thucal2) by [summivox](https://github.com/summivox).
