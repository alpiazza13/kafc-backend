class FantasyTeam < Team
    belongs_to :league, optional: true
end
