namespace :utils do

  desc "Setup Development"
  task setup_dev: :environment do
    puts "Executando o setup de desenvolvimento ..."

    puts "Apagando o BD ... #{%x(rake db:drop)}"
    puts "Criando o BD ... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake utils:generate_admins)
    puts %x(rake utils:generate_members)
    puts %x(rake utils:generate_ads)

    puts "Concluído"
  end

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
      Member.create!( name: Faker::HarryPotter.character,
                      email: Faker::Internet.email,
                      password: "123456",
                      password_confirmation: "123456")
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
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join("public", "template", "images-for-ads", "#{Random.rand(9)}.jpg"), "r")
      )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"
  end
end
