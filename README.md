# LockedAttributes

Simple module that makes ActiveRecord attributes locked when the model has been saved.
Should one attempt to change a locked attribute, the model will invalidate with a `:locked` message.

## Usage

```ruby
class Post < ActiveRecord::Base
  include LockedAttributes
  lock_attributes :author
end
```

```ruby
post = Post.new
post.author = Author.find(1)
post.save

post.author = Author.find(2)
post.valid? # => false
```

## Todo

* Allow for several strategies (exception)
* Make it possible to lock attributes to their first value (not depending on #new_record?)

## Contributing to locked_attributes

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Theodor Tonum. See LICENSE.txt for
further details.

