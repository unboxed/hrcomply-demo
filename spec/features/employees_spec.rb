require 'rails_helper'

feature 'Employees', :type => :feature do
  background do
    FactoryGirl.create :employee, name: 'Andrew White', title: 'CTO', notes: 'Rails Core Team member'
  end

  scenario 'listing all employees' do
    visit '/employees'

    within '.page-header' do
      expect(page).to have_content('Employees')
    end

    within 'table' do
      expect(page).to have_content('Andrew White')
    end
  end

  scenario 'creating an employee' do
    visit '/employees'

    within '.page-header' do
      expect(page).to have_content('Employees')
    end

    click_link 'New Employee'

    within '.page-header' do
      expect(page).to have_content('New Employee')
    end

    fill_in 'Name', with: 'Richard Stobart'
    fill_in 'Title', with: 'CEO'
    click_button 'Create Employee'

    within '.page-header' do
      expect(page).to have_content('Employees')
    end

    within '.flash' do
      expect(page).to have_content('Employee was successfully created.')
    end
  end

  scenario 'updating an employee' do
    visit '/employees'

    within '.page-header' do
      expect(page).to have_content('Employees')
    end

    within 'table' do
      click_link 'Edit'
    end

    within '.page-header' do
      expect(page).to have_content('Edit Employee')
    end

    fill_in 'Title', with: 'Chief Technical Officer'
    click_button 'Update Employee'

    within '.page-header' do
      expect(page).to have_content('Employees')
    end

    within '.flash' do
      expect(page).to have_content('Employee was successfully updated.')
    end

    within 'table' do
      expect(page).to have_content('Chief Technical Officer')
    end
  end

  scenario 'deleting an employee' do
    visit '/employees'

    within '.page-header' do
      expect(page).to have_content('Employees')
    end

    within 'table' do
      click_link 'Delete'
    end

    within '.flash' do
      expect(page).to have_content('Employee was successfully deleted.')
    end

    within 'table' do
      expect(page).to_not have_content('Andrew White')
    end
  end
end
