# agendor-ruby
[![Build
Status](https://travis-ci.org/ResultadosDigitais/agendor-ruby.svg)](https://travis-ci.org/ResultadosDigitais/agendor-ruby)
[![Code
Climate](https://codeclimate.com/github/ResultadosDigitais/agendor-ruby/badges/gpa.svg)](https://codeclimate.com/github/ResultadosDigitais/agendor-ruby)

Gem to add contacts, deals and organizations to Agendor CRM

### Usage

You can get the list of all allowed resources attributes at https://api.agendor.com.br

Parameters `username` and `password` are optional. Token will be used when present (not nil nor '').

#### Person

```ruby
person_hash = {
  phones: [
    {
      number: "(00) 0000-0000",
      type: "work"
    },
    {   
      number: "(00) 0000-0000",
      type: "mobile"
    },
    {
      number: "(00) 0000-0000",
      type: "fax"
    }
  ],
  emails: ["email@email.com"],
  social: {
    facebook: "fb.com/user",
    twitter: "twitter.com/user",
    skype: "user",
    linkedIn: "linkedin.com/user"
    },
  address: {
    postalCode: "12345000",
    country: "Country",
    state: "SC",
    city: "City",
    district: "District",
    streetName: "Street",
    streetNumber: "111",
    additionalInfo: "Info"
    },
  name: "Abc",
  role: "Role",
  cpf: "11122233300"
}
client = Agendor::Person.new(token, username, password)
client.create(person_hash)
```

#### Organization

```ruby
organization_hash = {
  nickname: "Organization Name",
  category: 123,
  phones: [
    {
      number: "(11) 99999-5555",
      type: "mobile"
   }
  ]
}
client = Agendor::Organization.new(token, username, password)
client.create(organization_hash)
```
#### Deal

```ruby
deal_hash = {
  title: "Deal Title",
  organization: 123456,
  value: "20000",
}
client = Agendor::Deal.new(token, username, password)
client.create(deal_hash)
```

### Contributing to agendor-ruby

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
