private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum WeekDay
    Sunday
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday

    def self.to_json(e : WeekDay, json : JSON::Builder) : Nil
      value = case e
              when AEC::WeekDay::Sunday    then "sunday"
              when AEC::WeekDay::Monday    then "monday"
              when AEC::WeekDay::Tuesday   then "tuesday"
              when AEC::WeekDay::Wednesday then "wednesday"
              when AEC::WeekDay::Thursday  then "thursday"
              when AEC::WeekDay::Friday    then "friday"
              when AEC::WeekDay::Saturday  then "saturday"
              else
                raise Exception.new("unknown enum value for 'WeekDay' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::WeekDay
      value = pull.read_string
      case value
      when "sunday"    then AEC::WeekDay::Sunday
      when "monday"    then AEC::WeekDay::Monday
      when "tuesday"   then AEC::WeekDay::Tuesday
      when "wednesday" then AEC::WeekDay::Wednesday
      when "thursday"  then AEC::WeekDay::Thursday
      when "friday"    then AEC::WeekDay::Friday
      when "saturday"  then AEC::WeekDay::Saturday
      else
        raise Exception.new("unknown enum value for 'WeekDay' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::WeekDay::Sunday    then "sunday"
      when AEC::WeekDay::Monday    then "monday"
      when AEC::WeekDay::Tuesday   then "tuesday"
      when AEC::WeekDay::Wednesday then "wednesday"
      when AEC::WeekDay::Thursday  then "thursday"
      when AEC::WeekDay::Friday    then "friday"
      when AEC::WeekDay::Saturday  then "saturday"
      else
        raise Exception.new("unknown enum value for 'WeekDay' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::WeekDay?
      case key
      when "sunday"    then AEC::WeekDay::Sunday
      when "monday"    then AEC::WeekDay::Monday
      when "tuesday"   then AEC::WeekDay::Tuesday
      when "wednesday" then AEC::WeekDay::Wednesday
      when "thursday"  then AEC::WeekDay::Thursday
      when "friday"    then AEC::WeekDay::Friday
      when "saturday"  then AEC::WeekDay::Saturday
      else
        nil
      end
    end
  end
end
