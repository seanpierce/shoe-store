require "integration_spec_helper"
require "spec_helper"

describe("the index route", {:type => :feature}) do
  it 'successfully lands on index page' do
    visit '/'
    expect(page).to have_content("Shoe Plug")
  end
end

describe("path to shoe list", {:type => :feature}) do
  it 'successfully visits shoe list' do
    visit '/shoes'
    expect(page).to have_content(@shoe.name)
  end
end

describe("add a shoe", {:type => :feature}) do
  it 'allows a user to add a new shoe to be stored in the database' do
    visit('/')
    click_link('Add Shoes to List')
    fill_in('new-shoe', :with => 'doc martins')
    fill_in('new-shoe-cost', :with => 33)
    click_button('Submit')
    expect(page).to have_content('Doc Martins')
  end
end

describe("remove a shoe path", {:type => :feature}) do
  it 'allows a user to delete a shoe from the database' do
    visit('/shoes')
    click_link(@shoe.name)
    click_button('Delete shoe')
    expect(page).to have_content('there are no shoes in the database')
  end
end

describe("add a store", {:type => :feature}) do
  it 'allows a user to add a new store to be stored in the database' do
    visit('/stores/new')
    fill_in('new-store', :with => 'bill\'s shoe haus')
    click_button('Submit')
    expect(page).to have_content('Bill\'s Shoe Haus')
  end
end

describe("remove a store path", {:type => :feature}) do
  it 'allows a user to delete a store from the database' do
    visit('/stores')
    click_link(@store.name)
    click_button('Delete store')
    expect(page).to have_content('there are no stores in the database')
  end
end

describe("associate a shoe with a store path", {:type => :feature}) do
  it 'allows a user to add a shoe to a store' do
    visit('/stores')
    click_link(@store.name)
    select @shoe.name, :from => "add-shoe-to-store"
    click_button('add-shoe-button')
    expect(page).to have_content(@shoe.name)
  end
end

describe("associate a store with a shoe path", {:type => :feature}) do
  it 'allows a user to add a store to a shoe' do
    visit '/shoes'
    click_link @shoe.name
    select @store.name, :from => "add-store-to-shoe"
    click_button 'add-store-button'
    expect(page).to have_content(@store.name)
  end
end

describe("dissociate a store with a shoe path", {:type => :feature}) do
  it 'allows a user to remove a store from a shoe' do
    @shoe.stores << @store
    visit("/shoe/#{@shoe.id}")
    click_link "store#{@store.id}"
    expect(page).to have_content(@store.name)
  end
end

describe("dissociate a shoe with a store path", {:type => :feature}) do
  it 'allows a user to remove a shoe form a store' do
    @store.shoes << @shoe
    visit("/store/#{@store.id}")
    click_link "shoe#{@shoe.id}"
    expect(page).to have_content(@shoe.name)
  end
end
