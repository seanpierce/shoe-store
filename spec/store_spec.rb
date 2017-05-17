require 'spec_helper'

describe(Store) do
  it { should have_and_belong_to_many(:shoes) }

  it "capitalizes the name before saving" do
    store = Store.create(name: "bill's shoe haus")
    expect(store.name).to(eq("Bill's Shoe Haus"))
  end

  it "validates presence of name" do
    shoe = Shoe.new(name: "")
    expect(shoe.save).to(eq(false))
  end
end
