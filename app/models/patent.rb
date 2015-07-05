class Patent

  def self.find(ipc_id)
    filename = "app/data/ipgod10404172015.csv"
    # patents = []
    # CSV.foreach(filename) do |row|
    #   patents << row if row[2] == ipc_id
    # end

    patents = ["2011288044", "2012286557", "2009253727", "2010221783", "2003100345", "2008315932"]
    results = []
    patents.each do |result|
      results << { url: Patent.url(result), patent_id: result}
    end

    results
  end

  def self.url(patent_id)
    "http://pericles.ipaustralia.gov.au/ols/auspat/applicationDetails.do?applicationNo=#{patent_id}"
  end

end
