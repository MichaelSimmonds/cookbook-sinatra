require "nokogiri"
require "open-uri"


class Recipe_scraper
  def initialize
      # @file_path = "strawberry.html"
  end

  def scrape_site(ingredient, difficulty_option)
    results_array = []
    # p difficulty_option
    if difficulty_option != ""
      url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}&dif=#{difficulty_option}"
    else
      url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
    end
    # puts url
    doc = Nokogiri::HTML(open(url))
    doc.css("div.m_contenu_resultat").each do |div|
      title = div.css(".m_titre_resultat").text.strip
      desc = div.css(".m_texte_resultat").text.strip
      time = div.css(".m_detail_time > div").text.strip
      difficulty = desc.split("-")[2]
      results_array << [title, desc, time, difficulty]
    end
    return results_array
  end
end
