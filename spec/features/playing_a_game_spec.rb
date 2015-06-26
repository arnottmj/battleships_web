require 'spec_helper'

feature 'Playing a game.' do

  before(:each) do

    $game = nil

    in_browser(:one) do
      visit '/'
      click_on 'begin'
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
    end

    in_browser(:two) do
      visit '/'
      click_on 'begin'
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
    end

  end

  scenario 'As a player, I want ot be able to hit a ship' do

    in_browser(:one) do
      fill_in('hit_coord', with: 'A1')
      click_on 'Submit'
      expect(page).to have_content 'Well done! That was a hit!'

    end

    in_browser(:two) do
      fill_in('hit_coord', with: 'A1')
      click_on 'Submit'
      expect(page).to have_content 'Well done! That was a hit!'

    end

  end

  scenario 'As a player, I want ot be able to miss a ship' do

    in_browser(:one) do
      fill_in('hit_coord', with: 'A10')
      click_on 'Submit'
      expect(page).to have_content 'Sorry, that was a miss!'

    end

    in_browser(:two) do
      fill_in('hit_coord', with: 'A10')
      click_on 'Submit'
      expect(page).to have_content 'Sorry, that was a miss!'

    end

  end

end

