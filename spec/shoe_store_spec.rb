require "spec_helper"

describe(Shoe) do
  it { should have_and_belong_to_many(:stores) }

  it("ccapitalizes the name before saving") do
    shoe = Shoe.create({:name => "converse"})
    expect(shoe.name).to(eq("Converse"))
  end
end

describe(Store) do
  it { should have_and_belong_to_many(:shoes) }

  it("ccapitalizes the name before saving") do
    store = Store.create({:name => "bill's shoe haus"})
    expect(store.name).to(eq("Bill's Shoe Haus"))
  end
end
