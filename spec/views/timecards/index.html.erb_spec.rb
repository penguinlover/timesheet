require 'spec_helper'

describe "timecards/index" do
  before(:each) do
    assign(:timecards, [
      stub_model(Timecard,
        :total_hours => 1,
        :total_days => 2
      ),
      stub_model(Timecard,
        :total_hours => 1,
        :total_days => 2
      )
    ])
  end

  it "renders a list of timecards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
