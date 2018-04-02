require 'rails_helper'

RSpec.feature "Contacts", type: :feature do

  it "should send a message when all fields are filled correctly", js: true do
    visit root_path

    fill_in 'contact_name', with: "Diego Marczal"
    fill_in 'contact_email', with: "marczal@utfpr.edu.br"
    fill_in 'contact_message', with: "When the ruby on rails course start?"

    expect do 
      click_on 'Enviar'
    end.to change{Contact.count}.by(1)

    expect(page.current_path).to eq root_path
    expect(page).to have_selector('div.alert.alert-success', 
      text: 'Mensagem enviada com sucesso!')
  end

  it "should not send a message when exists fields filled incorrectly", js: true do
    visit root_path

    fill_in 'contact_name', with: " "
    fill_in 'contact_email', with: "marczal_utfpr.edu.br"
    fill_in 'contact_message', with: ""

    expect do 
      click_on 'Enviar'
    end.to change{Contact.count}.by(0)

    expect(page).to have_selector('div.alert.alert-danger', 
      text: 'Existem dados incorretos!')

    within('div.contact_name') do
      expect(page).to have_content("não pode ficar em branco")
    end

    within('div.contact_email') do
      expect(page).to have_content('não é válido')
    end

    within('div.contact_message') do
      expect(page).to have_content("não pode ficar em branco")
    end
  end

end
