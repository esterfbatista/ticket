json.array!(@tickets) do |ticket|
  json.extract! ticket, :name, :seat_id_seq, :address, :price_paid, :email_address
  json.url ticket_url(ticket, format: :json)
end