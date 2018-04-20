namespace :utils do

  desc "Cria Adminsitradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando Adminsitradores Fake ..."

    10.times do
      Admin.create!(
                    name: Faker::HarryPotter.character,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0,1].sample)
    end

    puts "Administradores cadastrados com sucesso!"
  end
end