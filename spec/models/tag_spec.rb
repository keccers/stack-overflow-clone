require 'spec_helper'

describe Tag do
  it { should validate_presence_of(:text) }
  it { should have_many(:questions_tags) }
  it { should have_many(:questions) }
end
