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

  desc "Cria Members Fake"
  task generate_members: :environment do
    puts "Cadastrando MEMBROS..."

    10.times do
      Member.create!(
                    email: Faker::Internet.email,
                    password: "123456"
      )
    end

    puts "MEMBROS cadastrados com sucesso!"
  end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: Faker::Lorem.sentence([2,3].sample),
        member: Member.all.sample,
        category: Category.all.sample
      )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"
  end
end
