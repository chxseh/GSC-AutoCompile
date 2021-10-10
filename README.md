# Auto Compile GSC Scripts & Release via GitHub Actions

When you commit, GitHub Actions will automatically compile, and release.

## How to Use

Simply press [Use this template](https://github.com/ChxseH/GSC-AutoCompile/generate), and change the GSC in `src\gsc\main.gsc`.

## Customization

### How to rename the release file

1. Change Line #11 in `tools\compile.bat`'s second pair of quotes.
2. Change Line #23 in `.github\workflows\main.yml` to the name you picked above.
3. Update `.gitignore` with the name you picked above.

### How to add more than one GSC file

Instructions in `tools\compile.bat`.

### Changing the Release Title

1. Change Line #21 in `.github\workflows\main.yml`.

### Changing the Release Tag

1. Change Line #19 in `.github\workflows\main.yml`.

### Changing the Branch compilation runs on

1. Change Line #4 in `.github\workflows\main.yml`.

## Credits

[@marvinpinto's action-automatic-releases GitHub Action](https://github.com/marvinpinto/action-automatic-releases)
