private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ManagedResourceDefaultVisibility
    Hidden
    Visible

    def self.to_json(e : ManagedResourceDefaultVisibility, json : JSON::Builder) : Nil
      value = case e
              when AEC::ManagedResourceDefaultVisibility::Hidden  then "hidden"
              when AEC::ManagedResourceDefaultVisibility::Visible then "visible"
              else
                raise Exception.new("unknown enum value for 'ManagedResourceDefaultVisibility' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ManagedResourceDefaultVisibility
      value = pull.read_string
      case value
      when "hidden"  then AEC::ManagedResourceDefaultVisibility::Hidden
      when "visible" then AEC::ManagedResourceDefaultVisibility::Visible
      else
        raise Exception.new("unknown enum value for 'ManagedResourceDefaultVisibility' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ManagedResourceDefaultVisibility::Hidden  then "hidden"
      when AEC::ManagedResourceDefaultVisibility::Visible then "visible"
      else
        raise Exception.new("unknown enum value for 'ManagedResourceDefaultVisibility' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ManagedResourceDefaultVisibility?
      case key
      when "hidden"  then AEC::ManagedResourceDefaultVisibility::Hidden
      when "visible" then AEC::ManagedResourceDefaultVisibility::Visible
      else
        nil
      end
    end
  end
end
