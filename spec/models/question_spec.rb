require 'spec_helper'

describe Question do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:asker_id) }
  it { should belong_to(:asker) }
  it { should have_many(:answers) }
  it { should belong_to(:best_answer) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should have_many(:questions_tags) }
  it { should have_many(:tags) }
end
