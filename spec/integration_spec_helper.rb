RSpec.configure do |config|
  config.before(:each) do
    @shoe = Shoe.create(name: 'Converse', cost: 30)
    @store = Store.create(name: 'Foot Locker')
  end
end

RSpec.configure do |config|
  config.after(:each) do
    Shoe.all.each do |d|
      d.destroy
    end
    Store.all.each do |d|
      d.destroy
    end
  end
end
