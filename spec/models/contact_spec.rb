require 'rails_helper'

describe Contact, type: :model do
  let!(:contact) { Contact.new(first_name: 'Test', email: 'test@gmail.com', phone: '123.456.7890', subject: 'Test Subject') }

  it 'is expected to have contact attributes' do
    expect(contact).to have_attributes(first_name: 'Test', email: 'test@gmail.com', phone: '123.456.7890', subject: 'Test Subject')
  end
end
