FactoryGirl.define do
  factory :brand do
    sequence(:name) {|n| "Brand-#{n}" }
    website "http://brandwebsite.com"
  end

  factory :banana_republic, parent: :brand do
    name 'Banana Republic'
    website 'http://bananarepublic.gap.com/'
  end

  factory :american_apparel, parent: :brand do
    name 'American Apparel'
    website 'http://store.americanapparel.net//'
  end

  factory :gap, parent: :brand do
    name 'Gap'
    website 'http://www.gap.com/'
  end

  factory :j_crew, parent: :brand do
    name 'J Crew'
    website 'http://www.jcrew.com'
  end

  factory :number_lab, parent: :brand do
    name 'NUMBER:Lab'
    website 'https://number-lab.com/'
  end

end