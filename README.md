# Engie Code Challenge

This Code Challenge is to show the implementation on a concern within a rails app that multiple models can use in order to store custom attributes without having to do a DB change to add that attribute.

## How to:

#### Clone app
```shell
git clone git@github.com:mboya/engie-cc.git
```

#### Setup the app locally
create and setup the DB - this is running SQLite at the moment
```shell
rake db:create db:migrate
```

#### Test
To check if the app has good/working tests, run:
```shell
rails test
```

to run a specific file test
```shell
rails test test/models/customer_test.rb
```

to run a specific file test block
```shell
rails test test/models/customer_test.rb:17
```

#### Test out on console

```shell
rails console
```
app has been setup up so that once the above code has been run it will automatically connect to the defined database

```shell
>> Customer.create({name: 'customer', phone_number: '555-555-555'})
>> customer = _
>> customer.set_custom_attribute(:email, 'customer@engie.com')
>> customer.save
```

The above quesry will be able to create a customer and add a custom attribute and value to the records.
Other functions can be run against the same record to manipulate and pull data from it

fetch
```shell
>> customer = Customer.find 1
>> customer.get_custom_attribute(:email)
```

remove
```shell
>> customer = Customer.find 1
>> customer.remove_custom_attribute(:email)
```

to view all the keys/custom attributes available against a specific record
```shell
>> customer = Custome.find 1
>> customer.custom_attributes_keys?
```

and also to check if a key exists within a record
```shell
>> customer = Customer.find 1
>> customer.custom_attribute?(:email)
```

and for search, this can work across multiple models that are linked to the concern
```shell
>> Customer.find_by_custom_attribute(:email, 'customer@engie.com')
```