class NflController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @players = Player.all
    @search_query ||= params[:search]
    if params[:search]
        @players = Player.search(params[:search])
    end

    if sort_column and sort_direction
      @players = @players.order(sort_column + " " + sort_direction)
    end
  end

  private
    def sort_column
      Player.column_names.include?(params[:column]) ? params[:column] : nil
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : nil
    end

end
