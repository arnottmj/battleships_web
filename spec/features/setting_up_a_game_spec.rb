require 'spec_helper'

feature 'The users can setup their ships.' do

  scenario 'Player 1, is able to place ships' do
    
    visit '/'
    click_on 'begin'

  end
end
