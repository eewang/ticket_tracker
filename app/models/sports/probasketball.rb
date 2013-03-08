class ProBasketball < Sport

  TEAMS = {
  :ATL => "Atlanta Hawks",
  :BOS => "Boston Celtics",
  :BKN => "Brooklyn Nets",
  :CHA => "Charlotte Bobcats",
  :CHI => "Chicago Bulls",
  :CLE => "Cleveland Cavaliers",
  :DAL => "Dallas Mavericks",
  :DEN => "Denver Nuggets",
  :DET => "Detroit Pistons",
  :GSW => "Golden State Warriors",
  :HOU => "Houston Rockets",
  :IND => "Indiana Pacers",
  :LAC => "Los Angeles Clippers",
  :LAL => "Los Angeles Lakers",
  :MEM => "Memphis Grizzlies",
  :MIA => "Miami Heat",
  :MIL => "Milwaukee Bucks",
  :MIN => "Minnesota Timberwolves",
  :NOJ => "New Orleans Hornets",
  :NYK => "New York Knicks",
  :OKC => "Oklahoma City Thunder",
  :ORL => "Orlando Magic",
  :PHI => "Philadelphia 76ers",
  :PHO => "Phoenix Suns",
  :POR => "Portland Trail Blazers",
  :SAC => "Sacramento Kings",
  :SAS => "San Antonio Spurs",
  :TOR => "Toronto Raptors",
  :UTH => "Utah Jazz",
  :WAS => "Washington Wizards"
  }

COLORS = <<-EOF
Atlanta Hawks:  #01244C (navy blue)  |  #D21033 (red)
Boston Celtics:  #05854C (green)  |  #EAEFE9 (silver)  |  #FFFFFF (white)
Brooklyn Nets: #000000 (black)  |  #FFFFFF (white)
Charlotte Bobcats:  #F26532 (orange)  |  #29588B (blue)
Chicago Bulls:  #D4001F (red)  |  #000000 (black)  |  #FFFFFF (white)
Cleveland Cavaliers:  #9F1425 (red)  |  #003375 (blue)  |  #B99D6A (gold)
Dallas Mavericks:  #006AB5 (blue)  |  #F0F4F7 (silver)
Denver Nuggets:  #4393D1 (powder blue)  |  #FBB529 (gold)
Detroit Pistons:  #ED174C (red)  |  #006BB6 (blue)
Golden State Warriors:  #002942 (dark blue)  |  #E75E25 (orange)  |  #FFC33C (gold)
Houston Rockets:  #CC0000 (red)  |  #FFFFFF (white)
Indiana Pacers:  #002E62 (navy blue)  |  #FFC225 (gold)
Los Angeles Clippers:  #EE2944 (red)  |  #146AA2 (blue)  |  #FFFFFF (white)
Los Angeles Lakers:  #4A2583 (purple)  |  #F5AF1B (gold)
Memphis Grizzlies:  #001B41 (navy blue)  |  #85A2C6 (light blue)  |  #FFFFFF (white)
Miami Heat:  #B62630 (red)  |  #1E3344 (dark gray/black)  |  #FF9F00 (gold)
Milwaukee Bucks:  #00330A (hunter green)  |  #C82A39 (red)
Minnesota Timberwolves:  #015287 (blue)  |  #000000 (black)  |  #EFEFEF (silver)
New Jersey Nets:  #002258 (navy blue)  |  #D32E4C (red)  |  #EFEFF1 (silver)
New Orleans Hornets:  #0095CA (light blue)  |  #1D1060 (purple)  |  #FEBB25 (gold)  |  #FFFFFF (white)
New York Knicks:  #2E66B2 (blue)  |  #FF5C2B (orange)
Oklahoma City Thunder:  #0075C1 (light blue)  |  #E7442A (orange)  
Orlando Magic:  #077ABD (blue)  |  #C5CED5 (silver)  |  #000000 (black)
Philadelphia 76ers:  #C5003D (red)  |  #000000 (black)  |  #C7974D (gold)
Phoenix Suns:  #48286C (purple)  |  #FF7A31 (orange)  |  #FFBC1E (gold)
Portland Trail Blazers:  #000000 (black)  |  #E1393E (red)  |  #B4BDC3 (silver)
San Antonio Spurs:  #000000 (black)  |  #BEC8C9 (silver)  |  #FFFFFF (white)
Sacramento Kings:  #743389 (purple)  |  #DCE2E4 (silver)  |  #000000 (black)
Toronto Raptors:  #CD1041 (red)  |  #ECEBE9 (silver)  |  #000000 (black)
Utah Jazz:  #001D4D (navy blue)  |  #448CCE (light blue)  |  #480975 (purple)
Washington Wizards:  #004874 (blue)  |  #BC9B6A (gold)
EOF

  def self.nba_teams_hash
    TEAMS
  end

  def self.nba_teams_abbr # => Converts hash to array
    self.nba_teams_hash.keys
  end

  def self.nba_teams_names # => Converts hash to array
    self.nba_teams_hash.values
  end

  def self.get_probasketball
    Sport.get_sports(ProBasketball.nba_team_names, "ProBasketball")
  end

end

