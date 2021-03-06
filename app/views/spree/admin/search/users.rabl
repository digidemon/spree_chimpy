collection(@users => :users)
attributes :email, :id, :mailchimp_lists_ids
address_fields = [:firstname, :lastname,
  :address1, :address2,
  :city, :zipcode,
  :phone, :state_name,
  :state_id, :country_id,
  :company]

  child :ship_address => :ship_address do
    attributes *address_fields
    child :state do
      attributes :name
    end

    child :country do
      attributes :name
    end
  end

  child :bill_address => :bill_address do
    attributes *address_fields
    child :state do
      attributes :name
    end

    child :country do
      attributes :name
    end
  end