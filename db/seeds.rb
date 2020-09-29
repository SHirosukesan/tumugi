# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ['home_usagu.jpg', 'noimg.jpg']

#-------------------------user側---------------------------------------------
5.times do |n|
  user = User.new(
    email: "test#{n + 1}@test.com",
    nickname: "おじいさん#{n + 1}",
    age: "86",
    prefecture: "和歌山県",
    profile: "初めまして、同年代の友人を作ろうと始めました。現在は田舎で一人暮らしをしています。趣味はゲーム、畑仕事パソコンには慣れませんがzoomとかも使えます。ゲームはFPSやフォートナイトをやってますDMくれたらゲーム名伝えるのでオンラインで遊びましょう。趣味はコスプレです。",
    password: "123456"
  )
  user.save
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/ojiisan_face.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/okinawa_shishimai.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/youkai_jinmenken.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/uma_bigfoot.png')
  )
end
# --------------------------------------------------------------------
5.times do |n|
  user = User.new(
    email: "test#{n + 5}@test.com",
    nickname: "元気なおばあさん#{n + 1}",
    age: "75",
    prefecture: "東京",
    profile: "初めまして75才になるおばあちゃんです。運動や旅行など現在でも元気に出かけております。一緒にいろいろな所へ遊びに行ける方を探しております",
    password: "123456"
  )
  user.save
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/obaasan_face.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/travel_old_couple.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/undou_kabetatefuse_old.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/dog_sleep_run.png')
  )
end
# -------------------------------------------------------------------
5.times do |n|
  user = User.new(
    email: "test#{n + 10}@test.com",
    age: "100",
    prefecture: "富士山",
    nickname: "山籠りが好きです#{n + 1}",
    profile: "草、木、山、生き物のことならなんでも気軽に聞いてください。30代から脱サラし、８８才までひとりで山籠りをしてきました。山や動物のことに関しては気軽に答えられると思います。現在は可愛いペットと山で過ごしています。",
    password: "123456"
  )
  user.save
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/syokuji_sennin_kasumi.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/setsubun_oni_kowai.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/landmark_sanbutsuji_nageiredou.png')
  )
end
# ------------------------------------------------------------------
5.times do |n|
  user = User.new(
    email: "test#{n + 15}@test.com",
    age: "70",
    prefecture: "大阪",
    nickname: "定年後の人#{n + 1}",
    profile: "雑談や話を聞くのが好きです気軽にお喋りできる方を探しています。電話でも大丈夫で。お手紙のやり取りも好きです。",
    password: "123456"
  )
  user.save
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/fantasy_mahoujin_syoukan.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/fantasy_kodama.png')
  )
end
# ----------------------------------------------------------------
5.times do |n|
  user = User.new(
    email: "test#{n + 20}@test.com",
    nickname: "定年になりました#{n + 1}",
    age: "65",
    prefecture: "福岡",
    profile: "以前までは現役の大工をやっておりました。定年といってもまだまだお手伝いできることがあると思います。町の改革や地域への貢献ができると嬉しいです。",
    password: "123456"
  )
  user.save
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/pose_relax_oldman.png')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/food_sushi_funamori.png')
  )
end
1.times do |n|
  user = User.new(
    email: "test#{n + 21}@test.com",
    nickname: "昔話に出てきますか？#{n + 1}",
    age: "300",
    prefecture: "室町",
    profile: "夫婦揃って一緒にやってます。あれ？昔話に出ていた？とよく聞かれることがあります。「そんな風には全く見えないと思いますが笑」気軽に話しかけていただけると嬉しいです。大きめの緑の亀を飼っています",
    password: "123456"
  )
  user.save
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/mukashibanashi_ojiisan_obaasan.jpg')
  )
  Image.create(
    user_id: user.id,
    image: File.open('./app/assets/images/dinosaur_dinosauroid_kyouryu_ningen.png')
  )
end




#-------------------------publisher側-------------------------------------------------



5.times do |n|
  publisher = Publisher.new(
    email: "test#{n + 1}@test.com",
    company_name: "特別養護老人ホームかが森#{n + 1}",
    number:"06-6686-5301",
    address: "北海道",
    profile: "初めまして特別養護老人ホームかが森です。現在施設の入居者様の活気があまりありません同年代の方と楽しく遊ぶことができると本人たちもやる気が出てくるのでわ？と感じるのですが、協力していただける方募集しております。",
    password: "123456"
  )
  publisher.save
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/achilles_old_woman.png')
  )
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/kotowaza_hato_mamedeppou.png')
  )
end

5.times do |n|
  publisher = Publisher.new(
    email: "test#{n + 5}@test.com",
    company_name: "80歳代集まれ！BgBgAg#{n + 1}",
    number:"092-512-0695",
    address:"関西地方全域、電話してきてください",
    profile: "80歳代の高齢の方のパーティーを開催しようと考えている会社です。率先して盛り上げていただける方５名ほど男女問わず募集しております",
    password: "123456"
  )
  publisher.save
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/roujin_party.png')
  )
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/food_sushi_funamori.png')
  )
end

5.times do |n|
  publisher = Publisher.new(
    email: "test#{n + 10}@test.com",
    company_name: "アンジェリーナ#{n + 1}",
    number:"092-512-0695",
    address:"アメリカ",
    profile: "ぬいぐるみを縫いたいので、頑張ってちょきちょき作っているのですがジ、ョリーっと失敗してしまします。使うのはハサミであってますか？誰か詳しい方教えていただきたいです",
    password: "123456"
  )
  publisher.save
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/nuigurumi_tedukuri,.jpg')
  )
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/setsubun_yakuyoke_iwashi.png')
  )
end

5.times do |n|
  publisher = Publisher.new(
    email: "test#{n + 15}@test.com",
    company_name: "伝説など昔話に詳しい方募集#{n + 1}",
    number:"092-512-0695",
    address:"天の川",
    profile: "語り部さんとして過去の話をこどもたちに伝えていって欲しい。伝説や過去の言い伝えなど文化が変わり忘れられて入っているものを取り戻したい",
    password: "123456"
  )
  publisher.save
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/dinosaur_dinosauroid_kyouryu_ningen.png')
  )
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/fantasy_kodama.png')
  )
end

5.times do |n|
  publisher = Publisher.new(
    email: "test#{n + 20}@test.com",
    company_name: "役者さん募集#{n + 1}",
    number:"092-512-0695",
    address:"安土桃山城跡",
    profile: "古くからの老舗です。味のある雰囲気を出したく高齢の方にコスプレしてもらい店をPRしてもらいたいです。仕事はイベントの１日のみ給料の代わりに旅行券と叙々苑を馳走します",
    password: "123456"
  )
  publisher.save
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/youkai_jinmenken.png')
  )
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/dinosaur_dinosauroid_kyouryu_ningen.png')
  )
end


1.times do |n|
  publisher = Publisher.new(
    email: "test#{n + 21}@test.com",
    company_name: "探偵募集#{n + 1}",
    number:"092-512-0695",
    address:"東京",
    profile: "潜入捜査をお願いします。成功報酬は１００万円一般の方に紛れ込むことのできるごく普通のご老人を５名探しています。体力に自信のある方はぜひ",
    password: "123456"
  )
  publisher.save
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/building_tantei_jimusyo.png')
  )
  PublisherImage.create(
    publisher_id: publisher.id,
    publisher_image: File.open('./app/assets/images/animal_character_hamster_angry.png')
  )
end

