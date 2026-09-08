private alias AS = Amazonite::S3

module Amazonite::S3
  enum InventoryFrequency
    Daily
    Weekly

    def self.to_json(e : InventoryFrequency, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryFrequency
      value = pull.read_string
      case value
      when "Daily"  then AS::InventoryFrequency::Daily
      when "Weekly" then AS::InventoryFrequency::Weekly
      else
        raise Exception.new("unknown enum value for 'InventoryFrequency' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::InventoryFrequency?
      case key
      when "Daily"  then AS::InventoryFrequency::Daily
      when "Weekly" then AS::InventoryFrequency::Weekly
      else
        nil
      end
    end
  end
end
