require 'spec_helper'

describe Ideas::Scopes::FeatureScope do

  before do
    @feature = Ideas::Models::Feature.new(1000, 'feature')
    @feature_scope = Ideas::Scopes::FeatureScope.new(@feature)
  end

  it 'should set description of feature' do
    @feature_scope.description 'description'
    @feature.description.should be == 'description'
  end

end
