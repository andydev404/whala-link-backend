require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { Link.new(long_url: 'https://whala.link') }

  it 'long_url should be present' do
    subject.long_url = nil
    expect(subject).to_not be_valid
  end

  it 'long_url should be a url' do
    subject.long_url = 'hello world!'
    expect(subject).to_not be_valid
  end
end
