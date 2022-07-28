class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_memberships_cost
  
  def total_memberships_cost
    total = 0
    self.object.memberships.each do |membership|
      total = total + membership.charge
    end
    total
  end
end
