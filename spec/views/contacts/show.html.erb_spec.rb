require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      name: "Name",
      birthday: "Birthday",
      phone: "Phone",
      address: "Address",
      credit_card: "Credit Card",
      franchise: "Franchise",
      email: "Email",
      user_id: "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Birthday/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Credit Card/)
    expect(rendered).to match(/Franchise/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/User/)
  end
end
