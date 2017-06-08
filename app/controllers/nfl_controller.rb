class NflController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @players = Player.order("#{sort_column} #{sort_direction}")
    if params[:search]
      @players = Player.search(params[:search]).order("#{sort_column} #{sort_direction}")
    end
  end

  private
    def sortable_columns
      ["player", "team", "position", "avg_attempts_per_game", "total_attempts", "total_yards", "average_yards_per_attempt", "yards_per_game", "total_touchdowns", "longest_rush", "first_downs", "first_down_percentage", "twenty_yards_plus_each", "forty_yards_plus_each", "fumbles"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "player"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
