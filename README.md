# Frontline Code Test

## Parameters
1. Should be solved in a language which demonstrates your skill for the position you have applied.
1. Deliver a working runnable solution and include a copy of the source code.
1. Write code typical of something we would be proud to have in Frontline software in production.
1. You will need to independently overcome any challenges you face in delivery. 
1. If applicable, please list your assumptions.
 
## Problem to Solve
Convert the string: 
`"(id,created,employee(id,firstname,employeeType(id), lastname),location)"`
to the following output 
```id
created
employee
- id
- firstname
- employeeType
-- id
- lastname
location
```
Bonus (output in alphabetical order):
```created
employee
- employeeType
-- id
- firstname
- id
- lastname
id
location
```

## Solution
The string is very similar to an S Expression.  Therefore, my solution utilizes the `sexpistol` gem to assist in parsing the string into a hash.  This is completed using the `sp_array_to_hash` method.  

The hash that is returned by `sp_array_to_hash` is then used by the `print_hash` method to output the fields in the required format.

By parsing the fields into a hash, this should allow flexibility in the future, should we encounter similarly formatted strings.

## Running
Clone the repository
```
git clone https://github.com/abohne/frontline.git
```

Change directory
```
cd frontline
```

If you don't have bundler installed, execute the following command:
```
gem install bundler
```

Have bundler installed the required gems
```
bundle install
```

Execute the script
```
ruby frontline.rb
```

## Example
```
[frontline@turnkey ~]$ git clone https://github.com/abohne/frontline.git
Cloning into 'frontline'...
remote: Counting objects: 24, done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 24 (delta 6), reused 24 (delta 6), pack-reused 0
Unpacking objects: 100% (24/24), done.
```

```
[frontline@turnkey ~]$ cd frontline/
[frontline@turnkey frontline]$
```

```
[frontline@turnkey frontline]$ gem install bundler
Fetching: bundler-1.15.4.gem (100%)
Successfully installed bundler-1.15.4
Parsing documentation for bundler-1.15.4
Installing ri documentation for bundler-1.15.4
1 gem installed
```

```
[frontline@turnkey frontline]$ bundle install
Fetching gem metadata from https://rubygems.org/.
Fetching version metadata from https://rubygems.org/
Resolving dependencies...
Rubygems 2.0.14.1 is not threadsafe, so your gems will be installed one at a time. Upgrade to Rubygems 2.1.0 or higher to enable parallel gem installation.
Using bundler 1.15.4
Fetching sexpistol 0.0.7
Installing sexpistol 0.0.7
Bundle complete! 1 Gemfile dependency, 2 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

```
[frontline@turnkey frontline]$ ruby frontline.rb
created
employee
- employeeType
-- id
- firstname
- id
- lastname
id
location
```

## Todo
- Create module encompassing `sp_array_to_hash` and `print_hash` methods
- Add RSpec tests
