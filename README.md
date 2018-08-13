# Bank Tech Test

A commandline program that handles a simple bank account, storing transactions and printing statements.


## How to use
* Clone this repo
* Run `bundle install`
* Open a REPL (eg.
[IRB](http://ruby-doc.org/stdlib-2.0.0/libdoc/irb/rdoc/IRB.html) or [Pry](https://github.com/pry/pry))
* Create a new account with `my_account = Account.new`
* Transactions can be completed with `#deposit` and `#withdraw` eg. `my_account.deposit(44.56)`
* View a statement with `#statement` eg. `my_account.statement`