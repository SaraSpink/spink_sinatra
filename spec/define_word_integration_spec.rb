require ('capybara/rspec')
require ('./app')
Capybara.app = Sinatra::Application
set(:Show_exception, false)

describe('the input path', {:type => :feature}) do
  it ('processes the user entry and returns a list of items') do
    visit('/')
    fill_in('Word', :with => 'poodle')
    click_button('Submit')
    expect(page).to have_content('poodle')
  end
end
