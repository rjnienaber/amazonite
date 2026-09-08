private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The Regional Internet Registry (RIR).
  enum Rir
    Ripe
    Apnic
    Arin
    Lacnic

    def self.to_json(e : Rir, json : JSON::Builder) : Nil
      value = case e
              when AEC::Rir::Ripe   then "ripe"
              when AEC::Rir::Apnic  then "apnic"
              when AEC::Rir::Arin   then "arin"
              when AEC::Rir::Lacnic then "lacnic"
              else
                raise Exception.new("unknown enum value for 'Rir' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Rir
      value = pull.read_string
      case value
      when "ripe"   then AEC::Rir::Ripe
      when "apnic"  then AEC::Rir::Apnic
      when "arin"   then AEC::Rir::Arin
      when "lacnic" then AEC::Rir::Lacnic
      else
        raise Exception.new("unknown enum value for 'Rir' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Rir::Ripe   then "ripe"
      when AEC::Rir::Apnic  then "apnic"
      when AEC::Rir::Arin   then "arin"
      when AEC::Rir::Lacnic then "lacnic"
      else
        raise Exception.new("unknown enum value for 'Rir' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Rir?
      case key
      when "ripe"   then AEC::Rir::Ripe
      when "apnic"  then AEC::Rir::Apnic
      when "arin"   then AEC::Rir::Arin
      when "lacnic" then AEC::Rir::Lacnic
      else
        nil
      end
    end
  end
end
