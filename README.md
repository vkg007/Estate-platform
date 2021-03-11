# Estate-Platform

* * *

Estate-Platform is an online website for real state purchase or sell.Anyone using this portal can post his/her property for sell or can purchase anyone's property after browsing list of properties posted by other users.

## About The Project

-   The project is developed using the framework of Ruby on Rails.
-   The main idea behind this Project is of eliminating brokers and middle men commission.
-   Anyone can view the properties listed and can raise an inquiry. If they are interested in the property, then they can  contact the person selling that property directly.
-   Anyone can list its property on the website for sale or rent.

### Build with

-   Ruby
-   Ruby on rails
-   Postgresql
-   Bootstrap
-   Javascript
-   HTML
-   CSS
-   Yarn
-   Bundle
-   

# Demo

* * *

You can try out a demo at [click me](https://estatevkg.herokuapp.com/)

## Prerequisites

* * *

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.0`
If not, install the right ruby version using RVM.

### Steps to install RVM

```shell
$ gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ \curl -sSL https://get.rvm.io | bash
```

### Steps to Install Ruby

```shell
$ rvm install ruby
$ rvm --default use ruby
```

### Install Rails

```shell
$  gem install rails
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Install Postgresql version 13.2

```shell
$  sudo apt-get -y install postgresql
```

## Local Deployment

* * *

1.  clone the repo

```shell
$ git clone https://github.com/vkg007/Estate-platform.git
```

2.  change directory

```shell
$ cd Estate-platform
```

3.  install bundles

```shell
$ bundle install
```

4.  setup database , Migration & Seed

```shell
$ rails db:setup
$ rake db:migrate
$ rake db:seed
```

5.  update database.yml

```shell
Goto Esatate-platform/config/database.yml
update username of your postgresql
update password of your postgresql
```

6.  Run the Rails Server

```shell
$ rails server
```

7.  Open the Browser and write in URL

```shell
http://localhost:3000
```

## Contributor

* * *

-   [Vivek gupta](https://github.com/vkg007)
