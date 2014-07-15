# btw change control

A little tool to send change control messages to logstash. Messages are sent as json over TCP.

# Installation

    gem install btw

# Configuration

Uses a json config file at ~/.btw.conf

E.g.

    $ cat ~/.btw.conf
    {
      "debug": false,
      "host": "logstash-server-01.mycompany.com",
      "port": 5600,
      "user": "a_sysadmin_user"
    }

You can also have multiple hosts which it will try to use in sequence:

    $ cat ~/.btw.conf
    {
      "debug": false,
      "host": [ "logstash-server-01.mycompany.com", "logstash-server-02.mycompany.com "],
      "port": 5600,
      "user": "a_sysadmin_user"
    }

If logstash-server-01.mycompany.com fails to connect, it will move on to logstash-server-02.mycompany.com.

# Usage

## Basics

The basic idea is for the tool to be as simple and quick as possible. A very basic message might look like this:

    $ btw this is just a test
    Going to send the following data:

    {"message"=>"this is just a test",
     "user"=>"a_sysadmin_user",
     "service"=>"btw-change-control",
     "timestamp"=>2014-07-14 15:49:26 +0100}

    Send this? [yes]
    Sent

## Time

The timestamp is Time.now by default. It uses Chronic, so you write dates and times quite natually:

    $ btw tomorrow at 8pm i will apply the package updates to our servers
    Going to send the following data:

    {"message"=>"tomorrow at 8pm i will apply the package updates to our servers",
     "user"=>"a_sysadmin_user",
     "service"=>"btw-change-control",
     "timestamp"=>2014-07-15 20:00:00 +0100}

    Send this? [yes]
    Sent

If for whatever reason Chronic us unable to parse the time out of your comment, you can force it using two slashes:

    $ btw server is working now after restarting the box /10 minutes ago/
    Going to send the following data:

    {"message"=>"server is working now after restarting the box /10 minutes ago/",
     "user"=>"a_sysadmin_user",
     "service"=>"btw-change-control",
     "timestamp"=>2014-07-14 15:46:13 +0100}

    Send this? [yes]
    Sent

Compare this to the timstamp without the slashes. It is picking up the word 'now' and using that for the timestamp:

    $ btw server is working now after restarting the box 10 minutes ago
    Going to send the following data:

    {"message"=>"server is working now after restarting the box 10 minutes ago",
     "user"=>"a_sysadmin_user",
     "service"=>"btw-change-control",
     "timestamp"=>2014-07-14 15:56:24 +0100}

    Send this? [yes]

## Fields

You can also add fields to the data:

    $ btw rebooting server:web-1 in env:production
    Going to send the following data:

    {"message"=>"rebooting server:web-1 in env:production",
     "user"=>"a_sysadmin_user",
     "service"=>"btw-change-control",
     "server"=>"web-1",
     "env"=>"production",
     "timestamp"=>2014-07-14 16:00:44 +0100}

    Send this? [yes]
    Sent

Field keys can only contain letters, and field values cannot have spaces.

## Warning 

As you can probably tell, you're writing the messages as arguments to the btw command. This means that if you use certain shell characters, the shell will process them, probably with unintented consequences. For example:

    $ btw changing syslog port to 515 (was 514) on logstash
    -bash: syntax error near unexpected token `('

If you need to, use single quotes:

    $ btw 'changing syslog port to 515 (was 514) on logstash'
    Going to send the following data:

    {"message"=>"changing syslog port to 515 (was 514) on logstash",
     "user"=>"a_sysadmin_user",
     "service"=>"btw-change-control",
     "timestamp"=>2014-07-14 17:15:00 +0100}

    Send this? [yes]
    Sent

# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
