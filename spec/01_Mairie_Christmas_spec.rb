require_relative '../lib/01_Mairie_Christmas'

describe "directory of Val d'Oise town halls" do
    it "find town hall e-mail of any city of Val d'Oise" do
      expect(directory("Chauvry")).to eq("mairie.de.chauvry@wanadoo.fr")
      expect(directory("Livilliers")).to eq("mairie-de-livilliers@wanadoo.fr")
      expect(directory("Vienne en Arthies")).to eq("mairie.viennearthies@wanadoo.fr")
      expect(directory("Menouville")).to eq("Pas d'email")
    end
end