require 'rails_helper'
RSpec.describe 'Add employee', type: :system, js: true, driver: :selenium_chrome do
    let(:employee_edit) {FactoryBot.build_stubbed(:employee)}

    scenario 'Add an employee successfully' do
        visit "/employees"
        click_link 'New Employee'
        fill_in 'employee[name]', with: employee_edit.name
        fill_in 'employee[last_name]', with: employee_edit.last_name
        fill_in 'employee[address]', with: employee_edit.address
        fill_in 'employee[phone]', with: employee_edit.phone
        fill_in 'employee[salary]', with: employee_edit.salary
        click_button "Create Employee"
        expect(page).to have_text("Employee was successfully created.")
        expect(page).to have_text(employee_edit.name)
    end

    describe 'Update' do 
        let!(:employee) {FactoryBot.create(:employee)}

        scenario 'List employees successfully' do
            visit "/employees"
            sleep 5
            expect(page).to have_text(employee.name)
        end

        scenario 'Edit an employee successfully' do
            visit "/employees"
            click_link 'Edit'
            fill_in 'employee[name]', with: employee_edit.name
            fill_in 'employee[last_name]', with: employee_edit.last_name
            fill_in 'employee[address]', with: employee_edit.address
            fill_in 'employee[phone]', with: employee_edit.phone
            fill_in 'employee[salary]', with: employee_edit.salary
            click_button "Update Employee"
            expect(page).to have_text("Employee was successfully updated.")
            expect(page).to have_text(employee_edit.name)
        end

        scenario 'Show an employee successfully' do
            visit "/employees"
            click_link 'Show'
            sleep 10
            expect(page).to have_text(employee.name)
        end

        scenario 'Delete an employee successfully' do
            visit "/employees"
            click_link 'Delete'
            sleep 5
            page.driver.browser.switch_to.alert.accept
            page.should have_content("Employee was successfully destroyed.")
            expect(page).to_not have_text(employee.name)
            sleep 5
        end

        scenario 'Cancel delete an employee successfully' do
            visit "/employees"
            click_link 'Delete'
            sleep 5
            page.driver.browser.switch_to.alert.dismiss
            expect(page).to have_text(employee.name)
            sleep 5
        end
    end
   
 end