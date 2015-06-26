require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions

  get '/' do
    if $game != nil
      session[:player] = 'player_2'
    else
      $game = Game.new(Player,Board)
      session[:player] = 'player_1'
    end
    session[:player_ships] = "submarine,battleship,aircraft_carrier,cruiser,destroyer"
    erb :index
  end

  get '/setup_game' do
    @ships = session[:player_ships].split(",")
    @status = params[:status]
    @board = $game.own_board_view $game.send(session[:player])
    erb :setup_game
  end

  post '/setup_game' do
    begin
      $game.send(session[:player]).place_ship(Ship.send(params[:ship_select]), params[:coord], params[:dir])
    rescue
      redirect "/new_game_21?status=invalid"
    end
    @ships = session[:player_ships].split(",")
    @ships.delete(params[:ship_select])
    session[:player_ships] = @ships.join(",")
    redirect '/setup_game'
  end

  get '/play_game' do
    @message = "#{session[:player]}, choose coordinate to fire!"
    @board = $game.opponent_board_view $game.send(session[:player])
    erb :play_game
  end

  post '/play_game' do
    begin
      @result = $game.send(session[:player]).shoot(params[:hit_coord].to_sym)
    rescue
      @message = 'Coordinate invalid. Please fire again.'
    end
    @board = $game.opponent_board_view $game.send(session[:player])
    redirect '/victory' if $game.has_winner?
    @message = 'Well done! That was a hit!' if @result == :hit || @result == :sunk
    @message = 'Sorry, that was a miss!' if @result == :miss
    erb :play_game
  end

  get '/victory' do
    @winner = 'Player 1' if $game.player_1.winner?
    @winner = 'Player 2' if $game.player_2.winner?
    erb :victory
  end


  run! if app_file == $0
end
