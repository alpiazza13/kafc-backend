class Formation < ApplicationRecord
    # validates :name, presence: true
    validate :name_dets

    has_many :lineups

    validate :gk_acc
    validate :def_acc
    validate :mids_acc
    validate :fwds_acc

    def name_dets
        valid =
            name.present? ? (
                name.size == 3 and
                ["3","4","5"].include?(name[0]) and
                ["3","4","5"].include?(name[1]) and
                ["1", "2","3","4"].include?(name[2]) and
                (name[0].to_i + name[1].to_i + name[2].to_i) == 10
            ) : false
            errors.add(:name, "Not a valid formation") unless valid
    end

    def gk_acc
        valid = gks.present? ? gks == 1  : true
        errors.add(:gks, "Can only have one goalkeeper in starting lineup") unless valid
    end

    def def_acc
        valid = defs.present? ? defs == name[0].to_i : true
        errors.add(:defs, "Must have #{name[0]} defenders in starting lineup") unless valid
    end

    def mids_acc
        valid = mids.present? ? mids == name[1].to_i : true
        errors.add(:mids, "Must have #{name[1]} midfielders in starting lineup") unless valid
    end

    def fwds_acc
        valid = fwds.present? ? fwds == name[2].to_i : true
        errors.add(:fwds, "Must have #{name[2]} forwards in starting lineup") unless valid
    end

end
