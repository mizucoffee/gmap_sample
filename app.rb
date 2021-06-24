require 'bundler/setup'
Bundler.require

require 'google_places'
require 'dotenv'

Dotenv.load
client = GooglePlaces::Client.new ENV['API_KEY']

# 周辺のスポットを検索
client.spots(34.7055051, 135.4983028).each do |spot| 
    puts spot.name
end

# 周辺のスポットを検索 - 日本語に対応する
client.spots(34.7055051, 135.4983028, :language => 'ja').each do |spot| 
    puts spot.name
end

# タイプで絞り込む
client.spots(34.7055051, 135.4983028, :language => 'ja', :type='cafe').each do |spot| 
    puts spot.name
end

# 単語で検索する
client.spots(34.7055051, 135.4983028, :language => 'ja', :name='ラーメン').each do |spot| 
    puts spot.name
end

# 情報の取得
puts client.spots(34.7055051, 135.4983028, :language => 'ja', :name => 'ラーメン')[0].inspect
