require 'spec_helper'

describe QuestionsTag do
  it { should validate_presence_of(:question_id) }
  it { should validate_presence_of(:tag_id) }
  it { should belong_to(:question) }
  it { should belong_to(:tag) }
end
