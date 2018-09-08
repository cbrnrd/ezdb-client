require "./spec_helper"

describe Ezdb::Client do

  it "works" do
    client = Ezdb::Client.new
    client.set("key", "value")
    client.get(key).should eq "value"
    client.delete("key")
  end
end
