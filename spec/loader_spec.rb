require 'spec_helper'

describe Ideas::Loader do

  before do
    @loader = Ideas::Loader.new
  end

  it 'should load empty file' do
    idea = @loader.load(File.expand_path('../resources/empty.idea', __FILE__))
    idea.should be_nil
  end

  it 'should load file with idea' do
    idea = @loader.load(File.expand_path('../resources/empty_idea.idea', __FILE__))
    idea.should_not be_nil
  end

  it 'should load several files with ideas' do
    file1 = File.expand_path('../resources/empty.idea', __FILE__)
    file2 = File.expand_path('../resources/empty_idea.idea', __FILE__)

    ideas = @loader.load file1, file2
    ideas.should_not be_nil
    ideas.length.should be == 2
  end

  it 'should load idea from block' do
    idea = @loader.load do
      idea 'idea' do

      end
    end
    idea.should_not be_nil
  end

  it 'should load idea from block without arguments' do
    expect {
      @loader.load 'arg1' do
        idea 'idea' do

        end
      end
    }.to raise_error(ArgumentError)
  end

  it 'should load idea from string' do
    idea = @loader.load string: 'idea "idea" do end'
    idea.should_not be_nil
  end

end