require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
  it { should validate_presence_of(:commenter_id) }
  it { should belong_to(:commentable) }
  it { should belong_to(:commenter) }
end
