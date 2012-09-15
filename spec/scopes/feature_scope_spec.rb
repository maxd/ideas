require 'spec_helper'

describe Ideas::FeatureScope do

  before do
    @feature = Ideas::Feature.new(1000, 'feature')
    @feature_scope = Ideas::FeatureScope.new(@feature)
  end

  it 'should set description of feature' do
    @feature_scope.description 'description'
    @feature.description.should be == 'description'
  end

end