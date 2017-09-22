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

# describe('the definition path', {:type => :feature}) do
#   it ('processes the user entry and returns a list of definitions') do
#     visit('/words/:id/definitions/')
#     fill_in('Enter a new definition', :with => 'joyful dog')
#     click_button('Submit')
#     expect(page).to have_content('joyful dog')
#   end
# end
