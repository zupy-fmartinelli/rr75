#encoding: utf-8
require "capybara/rails"
require "capybara/rspec"

describe "Cadastro de anúncios" do

	context "Preenchendo formulário corretamente" do
	it "deveria criar e exibir o novo anúncio", js: true do
	autentica
	visit "/"

	fill_in "Modelo", with: "Fusca"
	fill_in "Marca", with: "Volks"
	fill_in "Descricao", with: "Zero Bala Original Placa Preta"
	fill_in "Ano", with: "1972"
	fill_in "Valor", with: "6500"
	
	click_button "Create Anuncio"

	expect(page).to have_content "Fusca"
	expect(page).to have_content "Volks"
	expect(page).to have_content "Zero Bala Original Placa Preta"
	expect(page).to have_content "1972"
	expect(page).to have_content "6.500,00"
	
		end
	end



end


