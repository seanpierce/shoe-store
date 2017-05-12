require "spec_helper"

describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:categories) }
end

describe(Ingredient) do
  it { should have_and_belong_to_many(:recipes) }
end

describe(Category) do
  it { should have_and_belong_to_many(:recipes) }
end
