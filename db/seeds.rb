# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Problem.create(id: 10, content: "railsのサーバーを起動する時のコマンドはどれ？", answer: 5)
Problem.create(id: 2, content: "データベースを作成する時のコマンドは？", answer: 12)
Problem.create(id: 3, content: "config/routes.rbに定義したルーティングを出力する rake タスクとして適切なものは？", answer: 15)
Problem.create(id: 4, content: "ファイルの作成/変更/削除をgitのインデックスに追加するgitのコマンドは？", answer: 18)

Choice.create(id: 5, problem_id: 10, content: "rails s")
Choice.create(id: 6, problem_id: 10, content: "rails g")
Choice.create(id: 7, problem_id: 10, content: "rails c")
#Choice.create(:id => 8, :problem_id => 1, :content => "Frog")

Choice.create(id: 9, problem_id: 2, content: "rails db:migrate")
Choice.create(id: 10, problem_id: 2, content: "rake db:migrate" )
Choice.create(id: 11, problem_id: 2, content: "rails db:create")
Choice.create(id: 12, problem_id: 2, content: "rake db:create")

Choice.create(id: 13, problem_id: 3, content: "rake route")
Choice.create(id: 14, problem_id: 3, content: "rails routes")
Choice.create(id: 15, problem_id: 3, content: "rake routes")
Choice.create(id: 16, problem_id: 3, content: "rails route")

Choice.create(id: 17, problem_id: 4, content: "git status")
Choice.create(id: 18, problem_id: 4, content: "git add")
Choice.create(id: 19, problem_id: 4, content: "git commit")
Choice.create(id: 20, problem_id: 4, content: "git push")
