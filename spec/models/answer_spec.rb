require 'spec_helper'

describe Answer do
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:question_id) }
  it { should validate_presence_of(:responder_id) }
  it { should belong_to(:responder) }
  it { should belong_to(:question) }
  it { should have_many(:votes) }
  it { should have_many(:comments) }
end
