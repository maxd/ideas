require 'spec_helper'

describe Ideas::RootScope do

  before do
    @root_scope = Ideas::RootScope.new
  end

  it 'should load idea without block' do
    @root_scope.idea 'idea'
    @root_scope.context.should be_a(Ideas::Idea)
  end

  it 'should load idea with block' do
    @root_scope.idea 'idea' do
    end
    @root_scope.context.should be_a(Ideas::Idea)
  end

end