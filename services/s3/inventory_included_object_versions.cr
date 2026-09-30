private alias AS = Amazonite::S3

module Amazonite::S3
  enum InventoryIncludedObjectVersions
    All
    Current

    def self.to_json(e : InventoryIncludedObjectVersions, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryIncludedObjectVersions
      value = pull.read_string
      case value
      when "All"     then AS::InventoryIncludedObjectVersions::All
      when "Current" then AS::InventoryIncludedObjectVersions::Current
      else
        raise Exception.new("unknown enum value for 'InventoryIncludedObjectVersions' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::InventoryIncludedObjectVersions?
      case key
      when "All"     then AS::InventoryIncludedObjectVersions::All
      when "Current" then AS::InventoryIncludedObjectVersions::Current
      else
        nil
      end
    end
  end
end
