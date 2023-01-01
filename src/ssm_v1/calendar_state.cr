private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum CalendarState
    Open
    Closed

    def self.to_json(e : CalendarState, json : JSON::Builder) : Nil
      value = case e
              when AS::CalendarState::Open   then "OPEN"
              when AS::CalendarState::Closed then "CLOSED"
              else
                raise Exception.new("unknown enum value for 'CalendarState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CalendarState
      value = pull.read_string
      case value
      when "OPEN"   then AS::CalendarState::Open
      when "CLOSED" then AS::CalendarState::Closed
      else
        raise Exception.new("unknown enum value for 'CalendarState' when deserializing from json: '#{value}'")
      end
    end
  end
end
