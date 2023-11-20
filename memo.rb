require "csv"

puts "1(新規作成) 2(編集)"
memo_type = gets.to_i

if memo_type == 1
  puts "（新規作成）拡張子を除いたファイルを入力してください。"
  file_name_new = gets.chomp.to_s

  puts "メモしたい内容を記入してください。"
  puts "完了したら改行をし、[Ctrl+D]で保存します"
  input_memo = STDIN.read

  CSV.open("#{file_name_new}.csv", "w") do |contents_new|
    contents_new << [input_memo]
  end

elsif memo_type == 2
  puts "(編集)拡張子を除いた既存ファイル名を入力してください"
  puts "既存のファイルを編集します。"
  file_name_edit = gets.chomp.to_s

  puts "追記したい内容を入力してください。"
  puts "完了したら改行して[Ctri+D]を入力してください。"
  memo = STDIN.read

  CSV.open("#{file_name_edit}.csv", "a") do |contents_edit|
    contents_edit << [memo]
  end

else
  puts "1か2の数字を入力してください"
end

