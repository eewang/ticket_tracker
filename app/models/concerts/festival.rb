class Festival < Concert

  FESTIVALS = [
    "Electric Daisy Carnival",
    "Lollapalooza",
    "Coachella",
    "Bonnaroo Music Festival",
    "Ultra Music Festival",
    "Austin City Limits",
    "Electric Zoo",
    "Sasquatch",
    "Voodoo Experience",
    "Newport Folk Festival",
    "South by Southwest",
    "Bumbershoot",
    "Burning Man",
    "Outside Lands",
    "North by Northeast",
    "Summerfest",
    "North Coast Music Festival"
  ]

  def self.festival_list
    FESTIVALS
  end

  def self.get_festivals
    Concert.get_concerts(Festival.festival_list, "Festival")
  end

end
