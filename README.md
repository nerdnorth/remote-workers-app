

### Development Setup Using Vagrant

If you're a developer and want to get everything running locally, this is the easiest way.

Operating System: Windows, Mac, or Linux

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). It's free and it runs on Windows, Mac, and Linux.
2. Install [Vagrant](http://www.vagrantup.com/downloads) on your host machine.
3. Install [Git](http://git-scm.com/downloads).
   * If you're on Mac, you can use [GitHub for Mac](https://mac.github.com/).
   * If you're on Windows, you can use [GitHub for Windows](https://windows.github.com/).
4. Clone the repository to your host machine: `git clone git://github.com/churchio/onebody.git` (If you forked the project, clone from your own fork.)
5. In your terminal, change to the project directory: `cd onebody`
6. Run vagrant: `vagrant up`

Now visit the site running in development mode at http://localhost:8080.

You can use your favorite text editor to make changes inside the `onebody` directory. Changes should show in your browser after refreshing.

Check out [Using Vagrant](https://github.com/churchio/onebody/wiki/Using-Vagrant) on the wiki for further help and tips.

### Manual Development Setup on Mac or Linux

1. Install Ruby 2.2.2 or higher (we recommend you use [rbenv](https://github.com/sstephenson/rbenv) or [RVM](https://rvm.io/)).
1. Install MySQL.
1. Install Git.
1. Install ImageMagick.
1. Install Node.js.
1. `git clone git://github.com/churchio/onebody.git && cd onebody`
1. `mysql -uroot -e "grant all on onebody_dev.* to onebody@localhost identified by 'onebody';"`
1. `mysql -uroot -e "grant all on onebody_test.* to onebody@localhost identified by 'onebody';"`
1. `cp config/database.yml{.mysql-example,}`
1. `gem install bundler`
1. `bundle install` (If you get an error installing eventmachine, you might need to do [this](http://stackoverflow.com/a/31516586/197498))
1. `cp config/secrets.yml{.example,} && vim config/secrets.yml` and add a random secret token to both the "development" and "test" sections (you can use `rake secret` to generate a new random secret).
1. `rake db:create db:schema:load db:seed`
1. `rails server`

Now visit the site running in development mode at http://localhost:3000.

### Manual Development Setup on Windows

1. Download the Ruby 2.2 package from http://railsinstaller.org and install.
1. Download MariaDB stable from https://downloads.mariadb.org and install. Take note of what you enter for the root password.
1. Download Git from https://git-scm.com/download/win and install.
1. Download ImageMagick from http://imagemagick.org/www/binary-releases.html#windows and install.
1. Download Node.js from https://nodejs.org/en/download/ and install.
1. Open the "Git Bash" program, then run...
1. `git clone git://github.com/churchio/onebody.git && cd onebody`
1. `mysql -uroot -pROOT_PASSWORD -e "grant all on onebody_dev.* to onebody@localhost identified by 'onebody';"`
1. `mysql -uroot -pROOT_PASSWORD -e "grant all on onebody_test.* to onebody@localhost identified by 'onebody';"`
1. `cp config/database.yml{.mysql-example,}`
1. `gem install bundler`
1. `bundle install`
1. `cp config/secrets.yml{.example,} && vim config/secrets.yml` and add a random secret token to both the "development" and "test" sections (you can use `rake secret` to generate a new random secret).
1. `rake db:create db:schema:load db:seed`
1. `rails server`

Now visit the site running in development mode at http://localhost:3000.

### Tests

To run tests:

```
rspec
```

If you don't have a test database yet, create it like you did the dev database:

```
RAILS_ENV=test rake db:create db:schema:load
```

## Get Help

* [Slack Chat](https://slackin-churchio.herokuapp.com/)
* [Wiki](http://wiki.github.com/churchio/onebody)
* [Google Group](http://groups.google.com/group/churchio)
* [Help Guides](http://church.io/onebody/help)

## Copyright

Copyright (c) [Tim Morgan](http://timmorgan.org)

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

This software is license under the GNU Affero General Public License, version 3. See LICENSE provided with this program for the entire text.

"Church.IO" is a trademark of our federation of developers and cannot be used for promotional purposes without express written permission.

### Design

Design is a derivative of AdminLTE, copyright (c) almasaeed2010, available [here](https://github.com/almasaeed2010/AdminLTE), licensed under MIT license. See [LICENSE](https://github.com/almasaeed2010/AdminLTE/blob/master/LICENSE).
