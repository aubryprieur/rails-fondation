puts 'Cleaning database...'
Project.destroy_all
Fondation.destroy_all
Category.destroy_all

puts "----------"
puts 'Creating categories...'
[ "Arts et culture",
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
  ].each do |category|
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
      p Fondation.create!(title:title)
    end
   i += 15
 end

 puts "----------"
puts 'Creating projects...'
p Project.create!(
  title: "Sport et santé en milieu rural",
  description: "Dans une logique de prévention ou d’amélioration de la santé, la Fondation de France soutiendra des projets innovants qui favorisent l’accès à la pratique d’une activité physique régulière et de proximité pour les personnes qui en sont les plus éloignées (personnes âgées, en situation de handicap, souffrant de maladies chroniques, bénéficiaires des minima sociaux…). La santé est définie comme un état de complet bien-être physique, mental et social. Ces activités devront se dérouler en milieu rural et concerner très majoritairement les personnes qui y vivent, sans délimitation d’âge et au bénéfice du plus grand nombre. Les femmes adultes sont, par exemple, l’un des publics cibles de projets recevables. Les structures favoriseront l’ouverture sur la vie locale et la mixité des publics. La pérennisation de l’action devra être anticipée pour une meilleure intégration sur le territoire en question",
  link: "https://www.fondationdefrance.org/fr/sport-et-sante-en-milieu-rural-0",
  expiration: "21/02/2018",
  category_id: "8",
  fondation_id: "1083",

  )
p Project.create!(
  title: "En 2017, le prix Frédéric de Carfort récompensera une peinture",
  description: "Le Prix Frédéric de Carfort a été créé en 1992 sous l'égide de la Fondation de France. Il est destiné à une oeuvre de dessin, de sculpture ou de peinture. Il récompenser une recherche plastique figurative.Le Prix est annuel. Son montant est cette année de 2 300 Euros.
Le Prix Frédéric de Carfort 2017 sera attribué à une oeuvre de peinture.",
  link: "https://www.fondationdefrance.org/fr/sport-et-sante-en-milieu-rural-0",
  expiration: "24/11/2017",
  category_id: "8",
  fondation_id: "1083",
  )



