# Auto Compile GSC Scripts & Release via GitHub Actions

When you commit to your repository, GitHub Actions will automatically compile and release your GSC.

## How to Use

1. Press [Use this template](https://github.com/ChxseH/GSC-AutoCompile/generate).  
2. Place any amount of GSC into `src\gsc`. (Subdirectories are supported) 

## Customization

### Changing the default behavior / released file name

By default, GitHub Actions will compile every GSC file in `src\gsc` (and subdirectories) on it's own and ZIP them all up and release it.

If you prefer to have everything compiled into one GSC file, see `.github\workflows\main.yml`'s lines #14-20. (Note that subdirectories are not supported in this mode)

Also see those same lines if you want to change the released file name.

![img](https://i.imgur.com/1w2apXw.png)

### Changing the Release Title

![img](https://i.imgur.com/RpiXJoX.png)

1. Change Line #26 in `.github\workflows\main.yml`.

### Changing the Release Tag

1. Change Line #24 in `.github\workflows\main.yml`.

### Changing the Branch compilation runs on

1. Change Line #4 in `.github\workflows\main.yml`.

## Credits

[@marvinpinto's action-automatic-releases GitHub Action](https://github.com/marvinpinto/action-automatic-releases)
