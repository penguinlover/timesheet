require 'spec_helper'

describe "timecards/show" do
  before(:each) do
    @timecard = assign(:timecard, stub_model(Timecard,
      :total_hours => 1,
      :total_days => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
