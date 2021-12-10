# logwatch

[![Build Status](https://api.travis-ci.com/104ru/logwatch.svg?branch=master)](https://travis-ci.com/github/104ru/logwatch)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with logwatch](#setup)
  ¦ * [What logwatch affects](#what-logwatch-affects)
  ¦ * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)

## Overview

The logwatch module configures logwatch on Linux bases systems.
This is a fork of [jonnyx-logwatch](https://github.com/jonmosco/puppet-logwatch)
module. Improved to use PDK 2.0, puppet native typing and use of hiera.

## Module Description

The logwatch module will manage the installation and configuration of logwatch
on Linux based systems.

## Setup

**NOTE: You must have a proper MTA installed and configured to send mail externally.**

### Stdlib

This module requires puppetlabs-stdlib >= 3.2.0

### What logwatch affects

 * logwatch package.
 * logwatch configuration files.

## Usage

#### Using default values

```puppet
  class { '::logwatch': }
```

#### Using available parameters

```puppet
 class { '::logwatch':
   mail_to   => [ 'test@test.com ', 'more@test.com' ],
   mail_from => 'puppet@test.com',
   service   => [ 'sshd', 'httpd' ],
 }
```

#### Managing `ignore.conf`

Add a regex to `ignore.conf` to suppress that output from the logwatch report

```puppet
  logwatch::ignore { 'my_rule':
    regex => 'ignore_lines_that_match_this_regex',
  }
```

Alternatievely can be done with hiera:

```yaml
  logwatch::ignore:
    my_first_rule:
      regex: 'ignore_lines_that_match_this_regex'
    my_second_rule:
      regex: 'ignore_lines_that_match_that_regex'
```

