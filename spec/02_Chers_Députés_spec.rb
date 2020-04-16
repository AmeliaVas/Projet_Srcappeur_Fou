require_relative '../lib/02_Chers_Députés'

describe "directory of French Députés" do
    it "find email of any French Député" do
      expect(directory("M. Christophe Arend")).to eq("christophe.arend@assemblee-nationale.fr")
      expect(directory("Mme Blandine Brocard")).to eq("blandine.brocard@assemblee-nationale.fr")
      expect(directory("M. Jérôme Nury")).to eq("jerome.nury@assemblee-nationale.fr")
      expect(directory("Mme Souad Zitouni")).to eq("souad.zitouni@assemblee-nationale.fr")
    end
end