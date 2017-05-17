require "spec_helper"

describe(Shoe) do
  it { should have_and_belong_to_many(:stores) }

  it "capitalizes the name before saving" do
    shoe = Shoe.create(name: "converse all star", cost: 40)
    expect(shoe.name).to(eq("Converse All Star"))
  end

  it "validates presence of name" do
    shoe = Shoe.new(name:  "")
    expect(shoe.save).to(eq(false))
  end

  it "converts the cost from integer to readable USD format" do
    shoe = Shoe.create(name: "converse", cost: 45)
    expect(shoe.to_money(shoe.cost)).to(eq("45.00"))
  end
end
