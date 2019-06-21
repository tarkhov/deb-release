# Deb release

Debian package publishing scripts.

### Contents

1. [Compatibility](#compatibility)
2. [Installation](#installation)
   1. [Ubuntu](#ubuntu)
3. [Prepare](#prepare)
   1. [Export variables](#export-variables)
4. [Create new package](#create-new-package)
   1. [Make](#make)
   2. [Edit changelog and control](#edit-changelog-and-control)
   3. [Add release in changelog](#add-release-in-changelog)
   4. [Build source package](#build-source-package)
   5. [Go to parent directory](#go-to-parent-directory)
   6. [Publish to launchpad](#publish-to-launchpad)
5. [Create new release](#create-new-release)
   1. [New Version](#new-version)
   2. [Add release in changelog](#add-release-in-changelog)
   3. [Make](#make)
   4. [Build source package](#build-source-package)
   5. [Go to parent directory](#go-to-parent-directory)
   6. [Publish to launchpad](#publish-to-launchpad)
6. [Author](#author)
7. [License](#license)

## Compatibility

Name | Version
------- | -------
Ubuntu | 16.04 - 18.04 LTS

## Installation

### Ubuntu

From PPA:

```bash
sudo add-apt-repository ppa:tarkhov/ppa
sudo apt update
sudo apt install deb-release
```

## Prepare

You need to generate GPG key first.

### Export variables:

Put this code to `~./bashrc` for exporting veriables every time is machine loaded.

```bash
DEBEMAIL="your-email@example.com"
DEBFULLNAME="Full Name"
GPGKEY="your-gpg-key"
export DEBEMAIL DEBFULLNAME GPGKEY
```

## Create new package

**Important**: When creating a new package, the debian directory should not exist, it is created by the command from point 1, then you can edit control files, and so on.

### Make

Third argument is a license and optional, default **mit**.

```bash
dr-make my-package 0.1.0
```

### Edit changelog and control

Edit **debian/changelog** file and change *unstable* to *UNRELEASED*. Change **debian/control** file to fit your needs.

### Add release in changelog

This will replace *UNRELEASED* to distribution name, *unstable* cannot be changed this way.

```bash
dr-release
```

### Build source package

You need to export gpg key previously.

```bash
dr-build
```

### Go to parent directory

This directory contain source.changes needed for putting package to launchpad.

```bash
cd ..
```

### Publish to launchpad

```bash
dr-publish your-ppa-id package-source.changes
```

## Create new release

### New Version

Third argument is a release name, optional and not required.

```bash
dr-version 0.1.0 1
```

### Add release in changelog

Add the name of the version of ubunt instead of UNRELEASED, for example: bionic.

```bash
dr-release
```

### Make

Without revision number, example: a2site_0.1.3.

```bash
dr-make my-package 0.1.0
```

### Build source package

```bash
dr-build
```

### Go to parent directory

```bash
cd ..
```

### Publish to launchpad

```bash
dr-publish your-ppa-id package-source.changes
```

## Author

**Alexander Tarkhov**

* [Facebook](https://www.facebook.com/alex.tarkhov)
* [Twitter](https://twitter.com/alextarkhov)
* [Medium](https://medium.com/@tarkhov)
* [Product Hunt](https://www.producthunt.com/@tarkhov)

## License

This project is licensed under the **MIT License** - see the `LICENSE` file for details.
