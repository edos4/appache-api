class GsheetController < ApplicationController
  def authorize
    client_id = Google::Auth::ClientId.from_file "credentials.json".freeze
    token_store = Google::Auth::Stores::FileTokenStore.new file: "token.yaml".freeze
    authorizer = Google::Auth::UserAuthorizer.new client_id, Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY, token_store
    user_id = "default"
    credentials = authorizer.get_credentials user_id
    if credentials.nil?
      url = authorizer.get_authorization_url base_url: "urn:ietf:wg:oauth:2.0:oob".freeze
      puts "Open the following URL in the browser and enter the " \
           "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: "urn:ietf:wg:oauth:2.0:oob".freeze
      )
    end
    credentials
  end

  def index
    require "google/apis/sheets_v4"
    require "googleauth"
    require "googleauth/stores/file_token_store"
    require "fileutils"

    @data = []
    
    # Initialize the API
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = "Google Sheets API Ruby Quickstart".freeze
    service.authorization = authorize

    # Prints the names and majors of students in a sample spreadsheet:
    # https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
    spreadsheet_id = "1spLiW9AzfYp3K4LBBbGZzuWXRBoYfnY1eqn5lfC_3NY"
    range = "EagleEye!#{params[:start_cell]}:#{params[:end_cell]}"
    response = service.get_spreadsheet_values spreadsheet_id, range
    @data << "No data found." if response.values.empty?
    response.values.each do |row|
      @data << JSON.parse(row.inspect)
    end

    render json: @data
  end
end
