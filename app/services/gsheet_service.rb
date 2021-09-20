# frozen_string_literal: true

class GsheetService < ApplicationService
  # Do not put values on start_cell and end_cel to get the entire sheet

  attr_reader :spreadsheet_id, :sheet_name, :start_cell, :end_cell

  def initialize(spreadsheet_id, sheet_name, start_cell, end_cell)
    @spreadsheet_id = spreadsheet_id
    @sheet_name = sheet_name
    @start_cell = start_cell
    @end_cell = end_cell
  end

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

  def call
    require "google/apis/sheets_v4"
    require "googleauth"
    require "googleauth/stores/file_token_store"
    require "fileutils"

    @data = []
    
    # Initialize the API
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = "Google Sheets API Ruby Quickstart".freeze
    service.authorization = authorize

    if start_cell.present? && end_cell.present?
      range = "#{sheet_name}!#{start_cell}:#{end_cell}"
    else
      range = "#{sheet_name}"
    end
    
    response = service.get_spreadsheet_values spreadsheet_id, range
    @data << "No data found." if response.values.empty?
    response.values.each do |row|
      @data << JSON.parse(row.inspect)
    end

    @data
  end

  private

  def quote_params
    @params.permit(:quote, :shipments, :amount_total, :amount_cod, :from_address_id, :to_address_id,
      from_address: {}, to_address: {}, options: {}, items: [:name, :description, :quantity, :price])
  end

  def parse_from_address(quote_params)
    if quote_params[:from_address_id].present?
      @current_company.pickup_addresses.find_by(id: quote_params[:from_address_id])
    elsif quote_params[:from_address].present?
      @current_company.pickup_addresses.new(quote_params[:from_address])
    else
      @current_company.default_address
    end
  end

  def parse_to_address(quote_params)
    if quote_params[:to_address_id].present?
      @current_company.pickup_addresses.find_by(id: quote_params[:to_address_id])
    elsif quote_params[:to_address].present?
      @current_company.pickup_addresses.new(quote_params[:to_address])
    end
  end

  def validate_addresses(from_address, to_address)
    {
      from_address: {
        ondemand: from_address.valid_for_ondemand?,
        nextday: from_address.valid_for_nextday?,
      },
      to_address: {
        ondemand: to_address.valid_for_ondemand?,
        nextday: to_address.valid_for_nextday?,
      },
    }
  end
end
