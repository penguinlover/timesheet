require 'spec_helper'

describe "timecards/new" do
  before(:each) do
    assign(:timecard, stub_model(Timecard,
      :total_hours => 1,
      :total_days => 1
    ).as_new_record)
  end

  it "renders new timecard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", timecards_path, "post" do
      assert_select "input#timecard_total_hours[name=?]", "timecard[total_hours]"
      assert_select "input#timecard_total_days[name=?]", "timecard[total_days]"
    end
  end
end
