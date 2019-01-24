require_relative '../app.rb'

feature 'index' do

  scenario 'expect user to fill in their name and birthday' do
    visit '/'
    fill_in('name', with: 'John')
    fill_in('birth_date', with: 1)
    select('January', from: 'birth_month')
    click_button('Submit')
  end

end

feature 'birthday_message' do

  scenario 'expect a birthday message if current date matches birth date' do
    visit '/birthday_message'
    expect(page).to have_content("Happy birthday!")
  end

end
