class NflController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @players = Player.all
    @search_query ||= params[:search]
    @column_parameter ||= params[:column]
    @direction_parameter ||= params[:direction]
    if params[:search]
        @players = Player.search(params[:search])
    end

    if sort_column and sort_direction
      @players = @players.order(sort_column + " " + sort_direction)
    end

    respond_to do |format|
      format.html
      format.csv { send_data @players.to_csv, filename: "users-#{Date.today}.csv" }
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
