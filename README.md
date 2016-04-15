# Gary's Homebrew Tap

This repository contains a collection of Gary's [Homebrew](http://mxcl.github.com/homebrew/) (aka, Brew) "formulae". Brew is a simple package manager for OS X that's based on Git.

Traditionally, Brew packages are managed centrally at <https://github.com/mxcl/homebrew>. To update packages, a package developer has to send pull requests to update their packages to new versions. Recently, however, Brew added a feature called [Tap](https://github.com/mxcl/homebrew/wiki/brew-tap) which makes it possible to install packages from remote Git repositories. This Git repository is Atlassian's Homebrew Tap.

## Usage

First, add this tap to your Brew:

    brew tap gcbartlett/tap

Next, draft from the tap:

    brew install gcbartlett/tap/<formula>

Third, enjoy your new brew.
