class GsheetController < ApplicationController
  def index
    @data = GsheetService.call(params[:spreadsheet_id], params[:sheet_name], params[:start_cell], params[:end_cell])

    render json: @data
  end
end
