require 'spec_helper'

feature 'Placing ships.' do

  before(:each) do

    $game = nil

    in_browser(:one) do
      visit '/'
      click_on 'begin'
    end

    in_browser(:two) do
      visit '/'
      click_on 'begin'
    end

  end

  scenario 'As player 1, I am able to place my ships' do

    in_browser(:one) do
      select "submarine", :from => "ship_select"
      fill_in('coord', with: 'A1')
      choose('ver')
      click_on 'place ship'
      select "battleship", :from => "ship_select"
      fill_in('coord', with: 'B1')
      choose('ver')
      click_on 'place ship'
      select "cruiser", :from => "ship_select"
      fill_in('coord', with: 'C1')
      choose('ver')
      click_on 'place ship'
      select "destroyer", :from => "ship_select"
      fill_in('coord', with: 'D1')
      choose('ver')
      click_on 'place ship'
      select "aircraft_carrier", :from => "ship_select"
      fill_in('coord', with: 'E1')
      choose('ver')
      click_on 'place ship'
      click_on 'begin'
      expect(page).to have_content "player_1, choose coordinate to fire!"

    end

  end


  scenario 'As player 2, I am able to place my ships' do

    in_browser(:two) do
      select "submarine", :from => "ship_select"
      fill_in('coord', with: 'A1')
      choose('ver')
      click_on 'place ship'
      select "battleship", :from => "ship_select"
      fill_in('coord', with: 'B1')
      choose('ver')
      click_on 'place ship'
      select "cruiser", :from => "ship_select"
      fill_in('coord', with: 'C1')
      choose('ver')
      click_on 'place ship'
      select "destroyer", :from => "ship_select"
      fill_in('coord', with: 'D1')
      choose('ver')
      click_on 'place ship'
      select "aircraft_carrier", :from => "ship_select"
      fill_in('coord', with: 'E1')
      choose('ver')
      click_on 'place ship'
      click_on 'begin'
      expect(page).to have_content "player_2, choose coordinate to fire!"

    end

  end

end
