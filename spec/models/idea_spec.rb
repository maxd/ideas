require 'spec_helper'

describe Ideas::Models::Idea do

  before do
    @idea = Ideas::Models::Idea.new('idea')
  end

  it 'should not have nil title' do
    expect {
      Ideas::Models::Idea.new(nil)
    }.to raise_error(ArgumentError)
  end

  it 'should not have empty title' do
    expect {
      Ideas::Models::Idea.new('')
    }.to raise_error(ArgumentError)
  end

  it 'should be initialized' do
    @idea.title.should be == 'idea'
    @idea.state.should be == :new
    @idea.visibility.should be == [ :private ]
    @idea.features.should be_empty
  end

  context 'state field' do

    it 'should set known state of idea' do
      Ideas::Models::Idea::STATES.each do |value|
        @idea.state = value
        @idea.state.should be == value
      end
    end

    it 'should not set unknown state of idea' do
      expect {
        @idea.state = :abc
      }.to raise_error(ArgumentError)
    end

  end

  context 'visibility field' do

    it 'should set known visibility of idea' do
      Ideas::Models::Idea::VISIBILITIES.each do |value|
        @idea.visibility = value
        @idea.visibility.should be == [value]
      end
    end

    it 'should not set unknown visibility of idea' do
      expect {
        @idea.visibility = :abc
      }.to raise_error(ArgumentError)
    end

    it 'should set several visibilities of idea' do
      @idea.visibility = [:public, :sticky]
      @idea.visibility.should be == [:public, :sticky]
    end

    it 'should not set :public and :private visibility together' do
      expect {
        @idea.visibility = [:private, :public]
      }.to raise_error(ArgumentError)
    end

  end

  it 'should add feature for idea' do
    feature = Ideas::Models::Feature.new(1000, 'feature')
    expect {
      @idea.add_feature(feature)
    }.to change(@idea.features, :count).by(1)
  end

end