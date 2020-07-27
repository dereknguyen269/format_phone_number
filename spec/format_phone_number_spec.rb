# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FormatPhoneNumber do
  it 'has a version number' do
    expect(FormatPhoneNumber::VERSION).not_to be nil
  end

  context 'country code' do
    context 'with leading is 0' do
      it 'replace the “0” with current country code' do
        expect(FormatPhoneNumber.format('0897878965', 'th')).to match('+66897878965')
      end
    end

    context 'with leading is digits but without plus' do
      it 'adding plus in front of phone number' do
        expect(FormatPhoneNumber.format('66897878965', 'th')).to match('+66897878965')
      end
    end
  end
end
