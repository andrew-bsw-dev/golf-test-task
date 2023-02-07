module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :tee_offs,
          [Types::TeeOffType],
          null: false,
          description: 'Return a list of tee offs'

    field :available_tee_offs,
          [Types::TeeOffType],
          null: false,
          description: 'Return a list of available tee offs' do
            argument :date, GraphQL::Types::ISO8601Date, required: false
          end

    field :booked_tee_offs,
          [Types::TeeOffType],
          null: false,
          description: 'Return a list of booked tee offs' do
      argument :date, GraphQL::Types::ISO8601Date, required: false
    end

    field :cancelled_tee_offs,
          [Types::TeeOffType],
          null: false,
          description: 'Return a list of cancelled tee offs' do
      argument :date, GraphQL::Types::ISO8601Date, required: false
    end

    field :slot_booking,
          Types::TeeOffType,
          null: false,
          description: 'Return a tee off form available, after booking' do
      argument :id, Integer
    end


    field :cancel_booked_slot,
          Types::TeeOffType,
          null: false,
          description: 'Return a tee off after cacelled' do
      argument :id, Integer
    end

    field :filters_booking_by_name,
          [Types::TeeOffType],
          null: false,
          description: 'Return a tee off after cacelled' do
      argument :name, String, required: false
    end
    # Then provide an implementation:

    def tee_offs
      TeeOff.all
    end

    def available_tee_offs(date: nil)
      tee_offs = TeeOff.available
      tee_offs = tee_offs.for_date(date) if date.present?
      tee_offs
    end

    def booked_tee_offs(date: nil)
      tee_offs = TeeOff.booked
      tee_offs = tee_offs.for_date(date) if date.present?
      tee_offs
    end

    def slot_booking(id: nil)
      begin
        tee_off = TeeOff.available.find_by!(id: id)
        context[:current_user].tee_off_slots.create!(tee_off_id: tee_off.id, status: :confirmed)
        tee_off.update!(interval_flag: :booked)
        tee_off
      rescue StandardError => e
        raise e.message
      end
    end

    def cancel_booked_slot(id: nil)
      begin
        tee_off = TeeOff.booked.find_by!(id: id)
        raise 'You can only cancel that slot before an hour' unless DateTime.now < tee_off.start_at.ago(1.hours)

        tee_off_slot = tee_off.tee_off_slots.not_cancelled.find_by!(user_id: context[:current_user])
        tee_off_slot.update!(status: :cancelled)
        tee_off.update!(interval_flag: :available)
        tee_off
      rescue StandardError => e
        raise e.message
      end
    end

    def filters_booking_by_name(name: '')
      begin
        TeeOff.joins(:users).booked.where("LOWER(users.first_name) LIKE :name OR LOWER(users.last_name) LIKE :name", name: "%#{name.downcase}%")
      rescue StandardError => e
        raise e.message
      end
    end
  end
end
