require_relative '../lib/02_mairie_xmas'


describe 'la fonction get_townhall_email' do

  it "récupère l'email d'une commune et renvoie le hash de la commune et son email" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/60/abancourt.html")).to eq({"ABANCOURT"=>"mairie.abancourt@wanadoo.fr"}) 
  end
  it "récupère l'email d'une commune et renvoie le hash de la commune et son email" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/60/cuvergnon.html")).to eq({"CUVERGNON"=>"mairie.cuvergnon@wanadoo.fr"}) 
  end
  it "récupère l'email d'une commune et renvoie le hash de la commune et son email" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/60/la-neuville-en-hez.html")).to eq({"LA-NEUVILLE-EN-HEZ"=>"mairie.laneuvilleenhez@wanadoo.fr"}) 
  end
  it "récupère l'email d'une commune et renvoie le hash de la commune et son email" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/60/saint-crepin-aux-bois.html")).to eq({"SAINT-CREPIN-AUX-BOIS"=>"mairie.stcrepin@wanadoo.fr"}) 
  end
  
end
  
end