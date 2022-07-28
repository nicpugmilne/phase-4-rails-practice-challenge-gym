class Membership < ApplicationRecord
    belongs_to :client
    belongs_to :gym
    validates :gym_id, uniqueness: { scope: :client,
    message: "Client may only have a single membership per gym" }                                                                                                                                                                                                                                                                                                                                                               
end
