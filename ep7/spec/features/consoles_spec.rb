require 'rails_helper'

RSpec.describe 'Consoles features' do
    let(:view_consoles) do
        visit('/')
        click_link('Consoles')
    end
    describe 'viewing the index' do
        it 'list all of the consoles' do
            Console.create!(name: 'Switch', manufacturer: 'Nintendo')
            Console.create!(name: 'Wii', manufacturer: 'Nintendo')
            view_consoles

            expect(page).to have_content('Nintendo Switch')
            expect(page).to have_content('Nintendo Wii')

        end 
    end
    describe 'adding a new console' do
        it 'adds the console to the list of consoles' do
            view_consoles
            click_link('Add New Console')

            fill_in('Name', with: 'Playstation Vita')
            fill_in('Manufacturer', with: 'Sony')
            click_button('Create')
            
            expect(current_path).to have_content('/consoles')
            expect(page).to have_content('Sony Playstation Vita')
            
        end
    end
end