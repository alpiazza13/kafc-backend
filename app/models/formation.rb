class Formation < ApplicationRecord
    validates :name, presence: true
    # validate :name_dets

    has_many :lineups

    validate :gk_acc
    validate :def_acc
    validate :mids_acc
    validate :fwds_acc

    # def name_dets
    #     # if not
    #         # (
    #             name.size == 3 and
    #             ["3","4","5"].include?(name[0]) and
    #             ["3","4","5"].include?(name[1]) and
    #             ["2","3","4"].include?(name[2]) and
    #             (name[0].to_i + name[1].to_i + name[2].to_i) == 11
    #         # )
    #         # errors.add(:name, "Not a valid formation")
    #         : true
    #     # end
    # end

    def gk_acc
        gks.present? ? gks == 1  : true
    end

    def def_acc
        defs.present? ? defs == name[0].to_i : true
    end

    def mids_acc
        mids.present? ? mids == name[1].to_i : true
    end

    def fwds_acc
        fwds.present? ? fwds == name[2].to_i : true
    end

end
