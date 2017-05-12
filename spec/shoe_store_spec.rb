require "spec_helper"

describe(Shoe) do
  it { should have_and_belong_to_many(:stores) }
end

describe(Store) do
  it { should have_and_belong_to_many(:shoes) }
end
