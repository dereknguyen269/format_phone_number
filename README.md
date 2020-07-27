# FormatPhoneNumber
- Allow user to input any digits of phone number, but system will detect the correct number of digits if it's matched with current country or not.
- If number in the front is the same with other country code and digits of phone number input are not matched with current country, then add "+" in the front
- If number in the front is not matched with any country code and digits of phone number input are not matched with current country, then add current country digits number in the front.

For Ex. Current country code is ”+66” (system will detect country code based on "+66"), please find the rules below,

If user input “0” in front of phone number, then replace the “0” with current country code (which is “+66”)

Example 1.
+ User input = “0897878965”
+ Output = “+66897878965”

Example 2.
+ User input =  “66897878965”
+ Out put = “+66897878965”

Example 3.
+ User input = “62897878965” (Country code not match with current country ("66") and digits not valid for TH)
+ Output = “+62897878965” => Add "+" in the front

Example 4.
+ User input = “+66897878965”
+ Output = “+66897878965”

Example 5.
+ User input = “+62897878965” ("+62" is not TH country code and digits are not valid)
+ Output = “+62897878965” (Keep current phone number)
      
Example 6.
+ User input = “6289787” (Number is too short, will add "+")
+ Output = “+6289787” 
      
Example 7.
+ User input = “628978789655555” (Number is too long, will add "+")
+ Output = “+628978789655555”
      
Example 8.
+ User input = “897878” (Number in the front is not country code, but digits are not valid for TH number)
+ Output = “+66897878”

Example 9.
+ User input = “0897878” or "+0897878" or "+897878"
+ Output = “+66897878” (Remove "0" and "+", then add "+66" in the front"
      
Example 10.
+ User input = “897878965” (Number in the front is not country code, but digits are valid for TH number)
+ Output = “+66897878965”

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'format_phone_number'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install format_phone_number

## Usage

```ruby
FormatPhoneNumber.format(input_phone_number, country_code)
```
- input_phone_number : string, required.
- country_code : string, can be blank.

Example: 

```ruby
FormatPhoneNumber.format('0897878965', 'th') # => +66897878965
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/format_phone_number.

