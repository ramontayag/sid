# sid

Useful for multi-tenant apps where the data lives on the same database, but you want the elements of a tenant to associate with each other via relative ids, not the absolute database id. This is also known as the scoped id (sid).

## Why?

I wanted elements of a certain account to connect to one another via relative ids, not absolute. Why? Because if I wanted to just dump the data of that account, and load it back later, I didn't want to worry about the ids changing. The relations would stay intact.

## Installation and Usage

Add a `sid` integer column to the tables you want to have this. These tables should `belong_to` the thing you want to scope by. It's typically the `account_id`. Don't forget to add an index too!

In the models, add:

    class Page < ActiveRecord::Base
      has_sid :account_id
      # has_sid, :account_id, :sid_column => :some_other_column # you can specify what column it will consider the sid column. Defaults to `sid`
    end

## Contributing to sid

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Ramon Tayag. See LICENSE.txt for
further details.
