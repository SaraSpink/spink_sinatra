require ('capybara/rspec')
require ('./app')
Capybara.app = Sinatra::Application
set(:Show_exception, false)

describe('the input path', {:type => :feature}) do
  it ('processes the user entry and returns a list of items') do
    visit('/')
    fill_in('my_word', :with => 'poodle')
    click_button('Go!')
    expect(page).to have_content('poodle')
  end
end
