class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif (user.tickets < attraction.tickets)
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif (user.height < attraction.min_height)
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      new_tickets = self.user.tickets - self.attraction.tickets
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.update(:happiness => new_happiness, :nausea => new_nausea, :tickets => new_tickets)
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
