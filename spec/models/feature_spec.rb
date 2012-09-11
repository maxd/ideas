require 'spec_helper'

describe Ideas::Models::Feature do

  before do
    @feature = Ideas::Models::Feature.new(1000, 'feature')
  end

  it 'should not have weight less than 0' do
    expect {
      Ideas::Models::Feature.new(-1, 'feature')
    }.to raise_error(ArgumentError)
  end

  it 'should not have weight great than 1000' do
    expect {
      Ideas::Models::Feature.new(1001, 'feature')
    }.to raise_error(ArgumentError)
  end

  it 'should not have nil title' do
    expect {
      Ideas::Models::Feature.new(1000, nil)
    }.to raise_error(ArgumentError)
  end

  it 'should not have empty title' do
    expect {
      Ideas::Models::Feature.new(1000, '')
    }.to raise_error(ArgumentError)
  end

  it 'should be initialized' do
    @feature.weight.should be == 1000
    @feature.title.should be == 'feature'
    @feature.description.should be_nil
  end

end