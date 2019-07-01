# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_params = {
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
}

article_params = {
  name: 'Journal of Food and Clinical Nutrition',
  content: "<div class=\"trix-content\">\n  <div>\n<strong>Journal of Food and Clinical Nutrition</strong> is an international peer reviewed journal that publishes recent research developments made in the field of food science and nutrition biology. The journal provides an open access platform for the dissemination of the latest developments in the field of food and nutrition.<br><br>The journal encompasses a broad range of topics that include multiple aspects of nutrition, dietetics and their application in clinical nutrition, sports nutrition and public health. The journal specifically prioritizes the manuscripts that may further the advent and application of medical nutrition therapies for the treatment, management and rehabilitation of patients with one or more acute or chronic diseases. <br><br>Other subject areas that are incorporated in the Journal of Food and Clinical Nutrition are Food Biotechnology; Nutrition and metabolism; Food Safety and Hygiene. Articles that provide novel insights into the clinical correlations between food and health are highly solicited. <br><br>The journal’s editorial manager system facilitates easy and smooth online submission, review and the publication status. The journal employs  single blind peer review system for screening the manuscripts. Acceptance and publication of any citable manuscript requires consent from two independent subject matter experts followed by the final approval of the editor-in-chief.</div>\n</div>\n"
}

if Rails.env.development?
  User.create!(user_params).tap do |user|
    user.articles.new(article_params).tap do |article|
      image = article.images.new(name: 'picture')
      image.file.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'food-1.jpeg')),
        filename: File.basename(Rails.root.join('app', 'assets', 'images', 'food-1.jpeg'))
      )
    end.save
  end
end
