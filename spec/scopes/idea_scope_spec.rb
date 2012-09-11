require 'spec_helper'

describe Ideas::Scopes::IdeaScope do

  before do
    @idea = Ideas::Models::Idea.new('idea')
    @idea_scope = Ideas::Scopes::IdeaScope.new(@idea)
  end

  it 'should set short description of idea' do
    @idea_scope.short_description 'short-description'
    @idea.short_description.should be == 'short-description'
  end

  it 'should set description of idea' do
    @idea_scope.description 'description'
    @idea.description.should be == 'description'
  end

  it 'should set state of idea' do
    @idea_scope.state :prototype
    @idea.state.should be == :prototype
  end

  it 'should set tags of idea' do
    @idea_scope.tags :my, :iphone
    @idea.tags.should be == [:my, :iphone]
  end

  it 'should set visibility of idea' do
    @idea_scope.visibility :public, :sticky
    @idea.visibility.should be == [:public, :sticky]
  end

  it 'should define new feature for idea without block' do
    @idea_scope.feature 1000, 'feature'
    @idea.features.should_not be_empty
  end

  it 'should define new feature for idea with block' do
    @idea_scope.feature 1000, 'feature' do
    end
    @idea.features.should_not be_empty
  end

end