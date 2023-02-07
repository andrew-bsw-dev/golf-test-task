module Timeable
  extend ActiveSupport::Concern

  included do
    scope :today, lambda {
      created_at_between(Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
    }

    scope :this_week, lambda {
      created_at_between(Time.zone.now.beginning_of_week, Time.zone.now.end_of_day)
    }

    scope :last_week, lambda {
      created_at_between(1.week.ago.beginning_of_week, 1.week.ago.end_of_week)
    }

    scope :days_ago_7, lambda {
      created_at_between((Time.zone.now - 7.days).beginning_of_day, Time.zone.now)
    }

    scope :days_ago_14, lambda {
      created_at_between((Time.zone.now - 14.days).beginning_of_day, Time.zone.now)
    }

    scope :days_ago_21, lambda {
      created_at_between((Time.zone.now - 21.days).beginning_of_day, Time.zone.now)
    }

    scope :this_month, lambda {
      created_at_between(Time.zone.now.beginning_of_month, Time.zone.now.end_of_day)
    }

    scope :last_month, lambda {
      created_at_between(1.month.ago.beginning_of_month, Time.zone.now.end_of_day)
    }

    scope :last_three_months, lambda {
      created_at_between(3.months.ago.beginning_of_month, Time.zone.now.end_of_day)
    }

    scope :this_year, lambda {
      created_at_between(Time.zone.now.beginning_of_year, Time.zone.now.end_of_day)
    }

    scope :last_year, lambda {
      created_at_between(1.year.ago.beginning_of_year, Time.zone.now.end_of_day)
    }

    scope :last_year, lambda {
      created_at_between(1.year.ago.beginning_of_year, Time.zone.now.end_of_day)
    }

    scope :for_date, ->(date){ 
      created_at_between(date.beginning_of_day, date.end_of_day)
    }

    scope :created_at_between, ->(time_zone1, time_zone2){ where(start_date: time_zone1..time_zone2) }
  end
end
