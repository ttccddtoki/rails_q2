# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create(id: 10, content: "railsのサーバーを起動する時のコマンドはどれ？", answer: 6)
Question.create(id: 2, content: "データベースを作成する時のコマンドは？", answer: 12)
Question.create(id: 3, content: "config/routes.rbに定義したルーティングを出力する rake タスクとして適切なものは？", answer: 15)
Question.create(id: 4, content: "ファイルの作成/変更/削除をgitのインデックスに追加するgitのコマンドは？", answer: 20)

Choice.create(id: 5, question_id: 10, content: "rails s")
Choice.create(id: 6, question_id: 10, content: "rails g")
Choice.create(id: 7, question_id: 10, content: "rails c")
#Choice.create(:id => 8, :question_id => 1, :content => "Frog")

Choice.create(id: 9, question_id: 2, content: "rails db:migrate")
Choice.create(id: 10, question_id: 2, content: "rake db migrate" )
Choice.create(id: 11, question_id: 2, content: "rails db:create")
Choice.create(id: 12, question_id: 2, content: "rake db:create")

Choice.create(id: 13, question_id: 3, content: "rake route")
Choice.create(id: 14, question_id: 3, content: "rails routes")
Choice.create(id: 15, question_id: 3, content: "rake routes")
Choice.create(id: 16, question_id: 3, content: "rails route")

Choice.create(id: 17, question_id: 4, content: "git status")
Choice.create(id: 18, question_id: 4, content: "git add")
Choice.create(id: 19, question_id: 4, content: "git commit")
Choice.create(id: 20, question_id: 4, content: "git push")
