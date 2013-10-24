require 'spec_helper'

describe Walkon do
  it "runs a daemon for playing entrance music" do
    expect(Walkon).to respond_to :start
  end
end
