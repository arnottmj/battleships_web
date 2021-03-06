require 'spec_helper'

feature 'Starting a two player game' do

  scenario 'The user can click begin and proceed to the setup page' do

    $game = nil

    in_browser(:one) do
      visit '/'
      expect(page).to have_content 'Welcome to battleships! Are you ready to begin?'
      click_on 'begin'
      expect(page).to have_content 'player_1, please position your ships'
    end

    in_browser(:two) do
      visit '/'
      expect(page).to have_content 'Welcome to battleships! Are you ready to begin?'
      click_on 'begin'
      expect(page).to have_content 'player_2, please position your ships'
    end
  
  end

end
