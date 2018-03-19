require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  describe "GET /" do

    it "should access root and see some links" do
      visit root_path
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Página Inicial')
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Entrar')
      expect(page).to have_selector(:css, "a[href='#{root_path}']")
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Registre-se agora mesmo!')
    end

  end
end
