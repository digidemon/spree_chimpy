require 'spec_helper'

module SpreeHominid
  class Interface
    def initialize(key)
      @api       = Hominid::API.new(key)
    end

    def subscribe(list_name, email)
      list_id = @api.find_list_id_by_name(list_name)
      @api.list_subscribe(list_id, email)
    end

    def unsubscribe(list_name, email)
      list_id = @api.find_list_id_by_name(list_name)
      @api.list_unsubscribe(list_id, email)
    end
  end
end

describe SpreeHominid::Interface do
  let(:interface) { SpreeHominid::Interface.new('1234') }
  let(:api)       { mock(:api) }

  before do
    Hominid::API.should_receive(:new).with('1234').and_return(api)
  end

  it "subscribes" do
    api.should_receive(:find_list_id_by_name).with('Members').and_return('a3d3')
    api.should_receive(:list_subscribe).with('a3d3', 'user@example.com')
    interface.subscribe('Members', "user@example.com")
  end

  it "unsubscribes" do
    api.should_receive(:find_list_id_by_name).with('Members').and_return('a3d3')
    api.should_receive(:list_unsubscribe).with('a3d3', 'user@example.com')
    interface.unsubscribe('Members', "user@example.com")
  end

  # subscribe
  # unsubscribe
  # find_list
  # add_merge_var
  # find_merge_var
end