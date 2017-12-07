require 'spec_helper'

describe "When a visitor visits conditions index" do
  it "visitor sees list of conditions" do

    visit '/conditions'

    expect(page).to have_content("Weather")
  end
end
