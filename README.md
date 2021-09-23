# Auto Compile GSC Scripts & Release via GitHub Actions

## How to use

Simply press [Use this template](https://github.com/ChxseH/GSC-AutoCompile/generate), and change the GSC in `src\gsc\main.gsc`.

When you commit, GitHub Actions will automatically compile, and release.

If you want to add more GSC files, see `tools\compile.bat`.

If you want to modify the release title/tag, or change the branch the compilation runs on, see `.github\main.yml`.

## Credits

[@marvinpinto's action-automatic-releases GitHub Action](https://github.com/marvinpinto/action-automatic-releases)
