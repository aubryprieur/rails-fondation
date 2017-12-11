puts 'Cleaning database...'
Tag.destroy_all
Project.destroy_all
Fondation.destroy_all
Category.destroy_all
Eligible.destroy_all

puts "----------"
puts "Creating eligible public"
eligibles = [ "Secteur ESS (association, coopérative...)",
  "Secteur public (collectivité...)",
  "Entreprise privée lucrative (SARL, SA...",
  "Personne physique (particulier, artiste...)"
  ]
  eligibles.each do |eligible|
  p Eligible.create!(name:eligible)
end

puts "----------"
puts 'Creating categories...'
categories = [ "Arts et culture",
  "Enseignements et formation initiale",
  "Éducation",
  "Sciences",
  "Sciences sociales",
  "Environnement",
  "Protection des animaux",
  "Divertissement et sport",
  "Santé",
  "Services sociaux",
  "Religion",
  "Développement de la communauté",
  "Société civile, loi, droits du citoyen",
  "Philantropie, bénévolat et secteur non lucratif",
  "Relations internationales",
  "Emploi et environnement de travail",
  "Alimentation",
  "Recherche médicale",
  "Solitude",
  "Agriculture",
  "Insertion",
  "Développement économique",
  "Développement rural",
  "Autre"
  ]
  categories.each do |category|
  p Category.create!(title:category)
end

puts "----------"
puts 'Creating fondations...'
require "open-uri"
require "nokogiri"
 i = 0
 until i > 4425
    doc = "http://www.centre-francais-fondations.org/fondations-fonds-de-dotation/annuaire/annuaires-1/?toutes=1&b_start:int=#{i}"
    fondations = Nokogiri::HTML(open(doc).read)
    fondations.search(".liste-fondation li").each do |e|
      title = e.search('a').text.strip.gsub("\n, ", "")
      p fondations = Fondation.create!(title:title)
    end
   i += 15
 end

 puts "----------"
puts 'Creating projects...'
p project1 = Project.create!(
  title: "Sport et santé en milieu rural",
  description: "Dans une logique de prévention ou d’amélioration de la santé, la Fondation de France soutiendra des projets innovants qui favorisent l’accès à la pratique d’une activité physique régulière et de proximité pour les personnes qui en sont les plus éloignées (personnes âgées, en situation de handicap, souffrant de maladies chroniques, bénéficiaires des minima sociaux…). La santé est définie comme un état de complet bien-être physique, mental et social. Ces activités devront se dérouler en milieu rural et concerner très majoritairement les personnes qui y vivent, sans délimitation d’âge et au bénéfice du plus grand nombre. Les femmes adultes sont, par exemple, l’un des publics cibles de projets recevables. Les structures favoriseront l’ouverture sur la vie locale et la mixité des publics. La pérennisation de l’action devra être anticipée pour une meilleure intégration sur le territoire en question",
  link: "https://www.fondationdefrance.org/fr/sport-et-sante-en-milieu-rural-0",
  expiration: "21/02/2018",
  category: Category.find_or_create_by(title: categories[8]),
  fondation: Fondation.find_or_create_by(title: fondations[1082])
  )
p project2 = Project.create!(
  title: "En 2017, le prix Frédéric de Carfort récompensera une peinture",
  description: "Le Prix Frédéric de Carfort a été créé en 1992 sous l'égide de la Fondation de France. Il est destiné à une oeuvre de dessin, de sculpture ou de peinture. Il récompenser une recherche plastique figurative.Le Prix est annuel. Son montant est cette année de 2 300 Euros.
Le Prix Frédéric de Carfort 2017 sera attribué à une oeuvre de peinture.",
  link: "https://www.fondationdefrance.org/fr/en-2017-le-prix-frederic-de-carfort-recompensera-une-peinture",
  expiration: "24/11/2017",
  category: Category.find_or_create_by(title: categories[0]),
  fondation: Fondation.find_or_create_by(title: fondations[1082])
  )
p project3 = Project.create!(
  title: "Le Prix Lacourière récompense un graveur en taille-douce",
  description: "Ce prix biennal, d'un montant de 10 000 Euros, est destiné à récompenser un graveur en taille-douce. Il a été créé par Madeleine Lacourière en 1979 sous l'égide de la Fondation de France en hommage au graveur et maître-imprimeur Roger Lacourière.",
  link: "https://www.fondationdefrance.org/fr/le-prix-lacouriere-recompense-un-graveur-en-taille-douce",
  expiration: " 07/04/2018",
  category: Category.find_or_create_by(title: categories[0]),
  fondation: Fondation.find_or_create_by(title: fondations[1082])
  )
p project4 = Project.create!(
  title: "Allez les filles !",
  description: "La pratique physique et sportive, outil d’insertion sociale, professionnelle et familiale pour les jeunes femmes des territoires sensibles ou isolés",
  link: "https://www.fondationdefrance.org/fr/sport-et-sante-en-milieu-rural-0",
  expiration: "17/01/2018",
  category: Category.find_or_create_by(title: categories[8]),
  fondation: Fondation.find_or_create_by(title: fondations[1082])
    )

# puts "----------"
# puts 'Creating project_eligible...'
# projecteligible1 = ProjectEligible.create!(
#   project: project1,
#   eligible: eligibles[0], eligibles[1]
#   )
# projecteligible2 = ProjectEligible.create!(
#   project: project2,
#   eligible: eligibles[3]
#   )
# projecteligible3 = ProjectEligible.create!(
#   project: project3,
#   eligible: eligibles[3]
#   )
# projecteligible4 = ProjectEligible.create!(
#   project: project4,
#   eligible: eligibles[0],eligibles[1]
#   )



