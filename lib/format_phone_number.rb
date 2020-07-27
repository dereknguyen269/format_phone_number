require 'format_phone_number/version'
require 'phonelib'
require 'countries'

module FormatPhoneNumber
  PHONE_REG_PATTERN = %r{[-' '\/[^-0-9\/]+]}.freeze
  MAXIMUM_PHONE_LENGTH = 15
  MINIMUM_PHONE_LENGTH = 6

  class Error < StandardError; end
  def self.format(phone, country_code = nil)
    hasplus = phone.start_with?('+') && phone[1] != '0'
    phone = phone.gsub(PHONE_REG_PATTERN, '')
    phone.sub!(/^[0]+/, '')
    plusphone = hasplus ? '+' + phone : phone
    invalid_data = !country_code || hasplus
    return plusphone if invalid_data

    country_code_text = ISO3166::Country[country_code]&.country_code
    if phone.size > MAXIMUM_PHONE_LENGTH && is_import_contact
      phone = phone.start_with?('+') ? phone : "+#{phone}"
    else
      parsed_phone = Phonelib.parse(plusphone, country_code)
      phone = get_parsed_phone_number(
        phone,
        parsed_phone,
        country_code_text,
        hasplus
      )
    end
    phone
  end

  def self.get_parsed_phone_number(phone, parsed_phone, country_code_text, _hasplus)
    return parsed_phone.e164 if parsed_phone.country_code

    first_prefix = !phone.start_with?('+') ? '+' : ''
    [first_prefix, country_code_text, phone].join('')
  end
end
