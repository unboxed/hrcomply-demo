require 'rails_helper'

feature 'Home', :type => :feature do
  background do
    visit '/'
  end

  scenario 'redirects to employees page' do
    within '.page-header' do
      expect(page).to have_content('Employees')
    end
  end
end
