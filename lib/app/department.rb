

class Department

  attr_accessor :emails_list, :dpt_name

  def initialize(name_to_save, url_to_scrap)
    @dpt_name = name_to_save
    @emails_list = self.get_all_emails(url_to_scrap)

  end

  # Récupération des URL des communes dans un tableau à partir de la liste des communes du département
  def get_townhall_urls(page_liste)
    doc = Nokogiri::HTML(URI.open(page_liste))
    tab_url = []

    # On trouve toutes les URL des communes, et on les ajoute dans le tableau créé précedemment, et on remplace le "." par le début de l'URL
    doc.xpath("//p/a/@href").each  {|url| tab_url << url.to_s.sub(/[.]/ , 'http://annuaire-des-mairies.com/')} 

    return tab_url
  end

  # Fonction qui génère un hash constitué du nom de la commune et de son adresse email à partir de l'URL de la commune
  def get_townhall_email(townhall_url)
    doc = Nokogiri::HTML(URI.open(townhall_url))
    email_h = {(doc.xpath("//div/div[1]/h1/small").text.split - ["Commune", "de"]).join=>doc.xpath("//section[2]/div/table/tbody/tr[4]/td[2]").text}
  end


  # Combinaison des 2 fonctions : à partir de la page du département, on va récupérer toutes les adresses emails associées
  def get_all_emails(page_dept)
    list_emails = []
    list_pages = []

    # On récupère les URL
    list_pages =  get_townhall_urls(page_dept)

    # Constitution du tableau de hash
    list_pages.each {|url| list_emails << get_townhall_email(url)}

    return list_emails
  end

  def save_as_JSON
    File.open("db/emails.json","w"){ |f| f << @emails_list.to_json }
  end

  def save_as_spreadsheet

      session = GoogleDrive::Session.from_config("config.json")
      ws = session.spreadsheet_by_key("1fDM9HbMJHtOT2yj5rXbdJyv0tGjFY7eOywRUPljQCM4").worksheets[0]

      i = 1
    self.emails_list.each do |hash|
      ws[i,1] = hash
      i += 1 
    end
      ws.save
  end

  def save_as_csv

    csv_file = CSV.open("db/emails.csv", "w") do |csv|
      self.emails_list.each do |hash|
        csv << [hash]
    
  end

end
 
